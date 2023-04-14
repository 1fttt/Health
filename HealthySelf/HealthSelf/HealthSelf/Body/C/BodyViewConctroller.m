//
//  ViewControllerBody.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "BodyViewConctroller.h"
#import "BodyView.h"
#import "SearchFoodViewController.h"
#import "RecordWtViewController.h"
#import "BlcdViewController.h"
#import "MapViewController.h"

#import <HealthKit/HealthKit.h>
#import <AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface BodyViewConctroller ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong)BodyView *viewBody;
//HealthKit
@property (nonatomic, strong) HKHealthStore *hkHStore; /**< 健康数据 */
@property (nonatomic, strong) HKObjectType *hkOType; /**< 获取的权限 */
@property (nonatomic, strong) HKSampleType *hkSType; /**< 获取采样数据类型 */
@property (nonatomic, assign) NSInteger allsteps;

//face
@property (nonatomic, strong) UIImagePickerController* imagePickerController;

- (void)upDateWalkSteps;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToSearchView) name:@"BodyToSearchFoodView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeWt:) name:@"changeWt" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toBlcdDietView) name:@"toBlcdDietView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toMapView) name:@"ToMapView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInitGetSteps) name:@"GetSteps" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SkinExtureAnalysis) name:@"SkinExtureAnalysis" object:nil];
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
                
            } else {
                double steps = [sampM.quantity doubleValueForUnit:unit];
                NSInteger stepIntegrs = (NSInteger)steps;
                allSteps += stepIntegrs;
            }
        }
        // 这里提示我不能在其他线程更新UI，回到主线程即可
        self.allsteps = allSteps;
        NSLog(@"获取步数成功:%ld", (long)allSteps);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self upDateWalkSteps];
        });
    }];
    [self.hkHStore executeQuery:hkSQ]; // 执行
}
- (void)upDateWalkSteps {
    if (self.allsteps == 0) {
        self.viewBody.stepsLbl.text = @"今日未运动";
    } else {
        self.viewBody.stepsLbl.text = [NSString stringWithFormat:@"%ld步", (long)self.allsteps];
    }
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
    RecordWtViewController *rcdVC = [[RecordWtViewController alloc] init];
    [self presentViewController:rcdVC animated:YES completion:nil];
}
- (void)ToSearchView {
    SearchFoodViewController *searchViewController = [[SearchFoodViewController alloc] init];
    [self.navigationController pushViewController:searchViewController animated:YES];
    
}
- (void)changeWt :(NSNotification *)sender {
    self.viewBody.crtWtNumLabel.text = sender.userInfo[@"weight"];
    NSArray *newWtAry = @[@"82.18", sender.userInfo[@"weight"], @"76.10"];
    self.viewBody.weightArray = newWtAry;
}
- (void)toBlcdDietView {
    NSLog(@"to BlacncedView");
    BlcdViewController *blcdViewC = [[BlcdViewController alloc] init];
    [self.navigationController pushViewController:blcdViewC animated:YES];
}
- (void)toMapView {
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}
//肤质分析
- (void)SkinExtureAnalysis {
    [self tapAvator];
}
#pragma mark CamareMethod
// 返回imagePickerController实例
- (UIImagePickerController *)imagePickerController {
    if (_imagePickerController == nil) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self; //delegate遵循了两个代理
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}
// 点击imageView
- (void)tapAvator {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"从相机拍摄您的皮肤" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self toCamera];
        }];
        UIAlertAction *album = [UIAlertAction actionWithTitle:@"从相册选取照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self toPhoto];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];

        [alert addAction:camera];
        [alert addAction:album];
        [alert addAction:cancel];

        [self presentViewController:alert animated:YES completion:nil];
}
// 跳转到相机
#pragma mark 相机
- (void)toCamera {
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
// 跳转到相册
- (void)toPhoto {
    //选择相册时，设置UIImagePickerController对象相关属性
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //跳转到UIImagePickerController控制器弹出相册
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

// 选中之后的事件
// didFinishPicking imagePickerController协议函数
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage* image = [info valueForKey:UIImagePickerControllerEditedImage];
    // 图片转64编码
    NSString *base64String = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [self imageRequest:base64String];
//    NSLog(@"%@", base64String);
    [self.imagePickerController dismissViewControllerAnimated:YES completion:nil];
}
- (void)imageRequest:(NSString *)imageBase64Str {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//https://aip.baidubce.com/rest/2.0/face/v1/merge?access_token=24.5156c3350534d49b01b7161906f8d485.2592000.1681983018.282335-30117396

    NSString *url = @"//https://aip.baidubce.com/rest/2.0/face/v1/merge?access_token=24.5156c3350534d49b01b7161906f8d485.2592000.1681983018.282335-30117396";
     //POST请求
    NSDictionary *Body = @{@"image":imageBase64Str};
    NSDictionary *header = @{@"Content-Type":@"application/x-www-form-urlencoded"};
    [manager POST:url parameters:Body headers:header progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"图片查找失败");
        UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您当前在黑夜，分析结果可能与实际不符。肤质：健康，推荐阳光下进行拍照" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alert addAction:sure];
        [self presentViewController:_alert animated:YES completion:nil];
    }];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
