//
//  EditViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import "EditViewController.h"
#import "EditView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface EditViewController ()<buttonDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) EditView *editView;
@property (nonatomic, strong) UIImagePickerController* imagePickerController;
@property (nonatomic, strong) UIImage* imageMyself;
@property (nonatomic, assign) NSInteger isSelectImage;
- (void)returnButton:(UIButton *)button;
@end

@implementation EditViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editView = [[EditView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.editView];
    [self.editView viewInit];
    self.editView.delegate = self;
    self.isSelectImage = 0;
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapAvator) name:@"Camare" object:nil];
}
#pragma mark button
- (void)returnButton:(UIButton *)button {
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (button.tag == 1) {
        [self sendLife];
    }
}
#pragma mark Send
- (void)sendLife {
    NSString *text = self.editView.titleTextField.text;
    if (text.length == 0 || ! [self isEmpty:text]) {
        [self errorText];
    } else {
        [self correctText];
    }
   
}
// 判断字符串是否全为空格
- (BOOL)isEmpty:(NSString *)str {
    if (!str) {
        return false;
    } else {
    //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and next line characters (U+000A–U+000D,U+0085).
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            //Returns a new string made by removing from both ends of the receiver characters contained in a given character
    NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return false;
        } else {
            return true;
        }
    }
}
// 非法输入函数
- (void)errorText {
    UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不合法，检查一下吧" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [_alert addAction:sure];
    [self presentViewController:_alert animated:YES completion:nil];
}
// 正确输入函数
- (void)correctText {
    if (self.isSelectImage == 0) {
        NSLog(@"不包含图片的分享");
    } else {
        NSLog(@"包含图片的分享");
    }
}


# pragma mark Camare
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
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self toCamera];
        }];
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self toPhoto];
        }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];

    [alert addAction:camera];
    [alert addAction:album];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
// 跳转到相机
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
// didFinishPicking imagePickerController协议函数
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self.imagePickerController dismissViewControllerAnimated:YES completion:nil];
    UIImage* image = [info valueForKey:UIImagePickerControllerEditedImage];
    self.editView.imageViewAvatar.image = image;
    self.isSelectImage = 1;
    // 选中图片之后才调用，cancel不调用
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
