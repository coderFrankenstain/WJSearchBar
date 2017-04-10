//
//  WJSearchButton.m
//  WJSearchBar
//
//  Created by 军魏 on 2017/4/6.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import "WJSearchButton.h"
#import "UIView+RMAdditions.h"
@implementation WJSearchButton
- (CGRect) titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 0, self.width-10-2, self.height);
}

- (CGRect) imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(self.width-10-2, 11, 10, 10);
    
}

- (void) setHighlighted:(BOOL)highlighted {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
