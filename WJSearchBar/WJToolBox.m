//
//  WJToolBox.m
//  WJSearchBar
//
//  Created by 军魏 on 2017/4/6.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import "WJToolBox.h"

@implementation WJToolBox


+(UIImage *)imageWithColor:(UIColor *)aColor{
    return [self imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


+ (void)cornerWithRadius:(CGFloat)radius andView:(UIView*) view {
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
}
@end
