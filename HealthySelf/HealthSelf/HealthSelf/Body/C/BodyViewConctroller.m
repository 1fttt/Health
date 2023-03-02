//
//  ViewControllerBody.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "BodyViewConctroller.h"
#import "BodyView.h"
#import <HealthKit/HealthKit.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface BodyViewConctroller ()
@property (nonatomic, strong)BodyView *viewBody;
//HealthKit
@property (nonatomic, strong) HKHealthStore *hkHStore; /**< 健康数据 */
@property (nonatomic, strong) HKObjectType *hkOType; /**< 获取的权限 */
@property (nonatomic, strong) HKSampleType *hkSType; /**< 获取采样数据类型 */
@end

@implementation BodyViewConctroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewBody = [[BodyView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewBody];
    [self.viewBody viewInit];
    self.navigationController.navigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToCgWtView) name:@"ToCgWtView" object:nil];
}

#pragma mark- MethodSteps
- (void)handleInitGetSteps {
        if ([HKHealthStore isHealthDataAvailable]) { // 检查是否支持获取健康数据
            self.hkHStore = [[HKHealthStore alloc] init];
            self.hkOType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount]; //获取步数类型
            NSSet *stepSet = [NSSet setWithObject:self.hkOType];
            __weak typeof(self) weakSelf = self;
            [self.hkHStore requestAuthorizationToShareTypes:nil readTypes:stepSet completion:^(BOOL success, NSError * _Nullable error) { // 获取步数授权
                if (success) {
                    [weakSelf handleGetWalkSteps];
                }else {
                    NSLog(@"status:%@ message:%@", @(error.code),  error.domain);
                }
            }];
        }else {
                    NSLog(@"message:%@", @"设备不支持HealthKit功能");
        }
}
// 获取当天时间开始跟结束： 00:00:00 ～ 23:59:59
- (NSDate *)handleGetDateWithCaledar:(NSCalendar *)calendar nowDate:(NSDate *)nowDate hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *dateNowComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dateNowComponents.day];
    [dateComponents setMonth:dateNowComponents.month];
    [dateComponents setYear:dateNowComponents.year];
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    [dateComponents setSecond:second];
    return [calendar dateFromComponents:dateComponents];
}
// 获取步数值
- (void) handleGetWalkSteps {
    self.hkSType = [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    NSSortDescriptor *startSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *endSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *nowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDate *startDate = [self handleGetDateWithCaledar:calendar nowDate:nowDate hour:0 minute:0 second:0];
    NSDate *endDate = [self handleGetDateWithCaledar:calendar nowDate:nowDate hour:23 minute:59 second:59];
    
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone]; // 筛选当天的数据
//    __weak typeof(self) weakSelf = self;
    HKSampleQuery *hkSQ = [[HKSampleQuery alloc] initWithSampleType:self.hkSType predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:@[startSortDec, endSortDec] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        NSLog(@"stepCounts:%@ results:%@ error:%@", query, results, error);
        HKUnit *unit = [HKUnit unitFromString:@"count"];// 看返回数据结构，应该这里步数的unit可以通过count字符串来实现。
        NSInteger allSteps = 0;
        for (HKQuantitySample *sampM in results) {
            NSInteger isUserWrite = [sampM.metadata[HKMetadataKeyWasUserEntered] integerValue];
            if (isUserWrite == 1) { // 用户手动录入的数据。
                
            }else {
                double steps = [sampM.quantity doubleValueForUnit:unit];
                NSInteger stepIntegrs = (NSInteger)steps;
                allSteps += stepIntegrs;
            }
        }
                    NSLog(@"获取步数成功:%ld", (long)allSteps);
    }];
    [self.hkHStore executeQuery:hkSQ]; // 执行
    /**
返回数据格式
     {
       HKSample = {
         HKObject = {
           NSObject = {
             isa = HKCumulativeQuantitySample
           }
           _UUID = xxx
           _sourceRevision = xxx
           _device = nil
           _metadata = 0x000000028291c940 1 key/value pair
           _provenanceID = 0
           _sourceBundleIdentifier = nil
           _creationTimestamp = 675566015.49851298
           _contributor = nil
         }
         _sampleType = 0x000000028257aca0
         _startTimestamp = 675565980
         _endTimestamp = 675565980
       }
       _quantity = 0x000000028291f2e0
       _freezeState = 2
       _count = 1
       _codableQuantitySample = nil
     }
     */
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)ToCgWtView {
    NSLog(@"change Data");
}
@end
