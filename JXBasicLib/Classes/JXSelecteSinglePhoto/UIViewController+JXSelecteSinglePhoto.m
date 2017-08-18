//
//  UIViewController+JXSelecteSinglePhoto.m
//  Pods
//
//  Created by Jiexiang on 2017/8/18.
//
//

#import "UIViewController+JXSelecteSinglePhoto.h"
#import "objc/runtime.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

#ifdef DEBUG
#define JXLog(...)  NSLog(__VA_ARGS__)
#else
#define JXLog(...)
#endif

// 是否需要编辑
static BOOL edit_ = NO;
static char blockKey;

@interface UIViewController() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, copy) ImageBlock imageBlock;

@end

@implementation UIViewController (JXSelecteSinglePhoto)


/**
 照片选择
 
 @param edit 是否裁剪
 @param chooseWay 获取方式
 @param imageBlock 照片回调
 */
- (void)chooseSinglePhotoWithEdit:(BOOL)edit chooseWay:(ChooseWay)chooseWay imageBlock:(ImageBlock)imageBlock {
    if (edit) {
        edit_ = edit;
    }
    self.imageBlock = [imageBlock copy];
    
    // 检查权限
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
        JXLog(@"没有权限");
        self.imageBlock(nil);
        return;
    }
    
    // 跳转到相机或相册
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = edit_;
    switch (chooseWay) {
        case ChooseWayCamera:
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                JXLog(@"该设备不支持相机");
                self.imageBlock(nil);
                return;
            }
            imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case ChooseWayAlbum:
            imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
    }
    [self presentViewController:imagePickerVC animated:true completion:nil];
}

# pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:true completion:nil];
    UIImage *image = [picker allowsEditing] ? [info objectForKey:UIImagePickerControllerEditedImage] : [info objectForKey:UIImagePickerControllerOriginalImage];
    if (self.imageBlock) {
        self.imageBlock(image);
    }
}

# pragma mark - 成员属性 imageBlock 的 get/set 方法

- (void)setImageBlock:(ImageBlock)imageBlock {
    objc_setAssociatedObject(self, &blockKey, imageBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ImageBlock)imageBlock {
    return objc_getAssociatedObject(self, &blockKey);
}

@end
