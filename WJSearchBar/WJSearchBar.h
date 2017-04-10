//
//  wjSearchBar.h
//  TjkxSchool
//
//  Created by 军魏 on 2017/1/12.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DidChangeBlock)(id object);

@interface WJSearchBar : UISearchBar
@property(copy,nonatomic) NSString* selectItem;
- (instancetype) initWithFrame:(CGRect)frame withArray:(NSArray*) array andSelectedBlock:(DidChangeBlock) block;
- (void) dismiss;
@end
