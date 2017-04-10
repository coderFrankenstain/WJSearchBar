//
//  wjSearchBar.m
//  TjkxSchool
//
//  Created by 军魏 on 2017/1/12.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import "wjSearchBar.h"
#import "WJSearchButton.h"
#import "WJToolBox.h"
#import "UIView+RMAdditions.h"
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
#define kScreen_Width  [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height [[UIScreen mainScreen] bounds].size.height
#define lineColor RGB(235, 235, 235)
@interface WJSearchBar()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) DidChangeBlock block;
@property (strong,nonatomic) UITextField* inputFiled;
@property (strong,nonatomic) WJSearchButton* button;
@property (strong,nonatomic) UITableView* tableView;
@property(strong,nonatomic) NSArray* dataArray;

@end

@implementation WJSearchBar

- (instancetype) init {
    if (self = [self initWithFrame:CGRectMake(-10, 0, kScreen_Width - 80, 30)]) {
        
        
        
        
        
    }
    return self;
}


- (instancetype) initWithFrame:(CGRect)frame withArray:(NSArray*) array andSelectedBlock:(DidChangeBlock) block{
    
    if (self = [super initWithFrame:frame]) {
        self.block = block;
        self.dataArray = array;

        [self setBackgroundImage:[WJToolBox imageWithColor:[UIColor whiteColor]]];
        [self setBackgroundColor:[UIColor whiteColor]];
        [WJToolBox cornerWithRadius:5 andView:self];
        self.layer.borderColor = lineColor.CGColor;
        self.layer.borderWidth = 1;
        [self becomeFirstResponder];
        [self setPlaceholder:@"搜索"];
        
        UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 55, 80, kScreen_Height*0.5)];
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.layer.borderColor = RGB(238, 238, 238).CGColor;
        tableView.layer.borderWidth = 1;
        tableView.showsVerticalScrollIndicator = NO;
        [WJToolBox cornerWithRadius:5 andView:self];
        self.tableView = tableView;
        
        
        UITextField* textF = nil;
        
        for (UIView* subview in self.subviews) {
            
            for (UIView* view in subview.subviews) {
                if ([view isKindOfClass:[UITextField class]]) {
                    
                    textF = (UITextField*)view;
                    break;
                    
                }
            }
        }
        self.inputFiled = textF;
        [self setItemString:@"全部"];
    }
    return self;
}

- (void)tapMiss {
    self.button.selected = !self.button.selected;
    [self searchItemSelect:self.button];
}

- (void) dismiss {
    [self.tableView removeFromSuperview];
}

- (void) searchItemSelect:(UIButton*) sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"greenUp"] forState:UIControlStateNormal];
        [[UIApplication sharedApplication].keyWindow addSubview:self.tableView];
        
    }
    else {
        [sender setImage:[UIImage imageNamed:@"greenDown"] forState:UIControlStateNormal];
        [self.tableView removeFromSuperview];
    }
}

- (void)setItemString:(NSString *)string {
    NSString* cateGoryString = string;
    CGSize cateGorySize = [cateGoryString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
    
    
    WJSearchButton* leftButton = [[WJSearchButton alloc] initWithFrame:CGRectMake(0, 0,cateGorySize.width+14, 30)];
    [leftButton setTitle:cateGoryString forState:UIControlStateNormal];
    [leftButton setTitleColor:RGB(44,44,44) forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [leftButton setImage:[UIImage imageNamed:@"greenDown"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(searchItemSelect:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.selected = NO;
    self.button = leftButton;
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,leftButton.width+5 , 30)];
    [leftView addSubview:leftButton];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(leftButton.width+4, 0, 1, 30)];
    lineView.backgroundColor = lineColor;
    [leftView addSubview:lineView];
    
    self.inputFiled.leftView = leftView;
    self.inputFiled.leftViewMode = UITextFieldViewModeAlways;
    self.selectItem = string;
    self.block(string);

}

#pragma -mark tableViewDelegate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
    }
    for (UIView* view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UILabel* contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 34)];
    contentLabel.text = self.dataArray[indexPath.row];
    contentLabel.font = [UIFont systemFontOfSize:13.0f];
    contentLabel.textColor = RGB(44, 44, 44);
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:contentLabel];
    

    UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 34, kScreen_Width, 1)];
    lineView.backgroundColor = RGB(233, 233, 233);
    [cell.contentView addSubview:lineView];
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* moveString = self.dataArray[indexPath.row];
    [self setItemString:moveString];
    [self tapMiss];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
