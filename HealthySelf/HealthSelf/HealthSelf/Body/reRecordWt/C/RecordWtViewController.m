//
//  RecordWtViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/3/2.
//

#import "RecordWtViewController.h"
#import "RecordWtView.h"
#import <Masonry/Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RecordWtViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) RecordWtView *recordView;
@property (nonatomic, strong) UIImagePickerController* imagePickerController;

@end

@implementation RecordWtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.recordView = [[RecordWtView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.recordView];
    [self.recordView viewInit];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(exit) name:@"exit" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addPhp) name:@"addPhp" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getHkData) name:@"getHkData" object:nil];
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
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"即刻拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
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
#pragma mark -NSNot
- (void)exit {
    NSLog(@"Cexit");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addPhp {
    NSLog(@"Cadd{Php");
    [self tapAvator];
}
- (void)getHkData {
    NSLog(@"CgetHK");
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
