//
//  UIViewController+JXSelecteSinglePhoto.h
//  Pods
//
//  Created by Jiexiang on 2017/8/18.
//
//

#import <UIKit/UIKit.h>

typedef void(^ImageBlock)(UIImage *image);

typedef NS_ENUM(NSUInteger, ChooseWay) {
    ChooseWayCamera,
    ChooseWayAlbum
};

@interface UIViewController (JXSelecteSinglePhoto)

/**
 照片选择
 
 @param edit 是否裁剪
 @param chooseWay 获取方式
 @param imageBlock 照片回调
 */
- (void)chooseSinglePhotoWithEdit:(BOOL)edit chooseWay:(ChooseWay)chooseWay imageBlock:(ImageBlock)imageBlock;

@end
