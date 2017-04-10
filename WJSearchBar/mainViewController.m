//
//  mainViewController.m
//  WJSearchBar
//
//  Created by 军魏 on 2017/4/6.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import "mainViewController.h"
#import "WJSearchBar.h"

@interface mainViewController ()<UISearchBarDelegate>
@property(strong,nonatomic) WJSearchBar* searchBar;
@property(strong,nonatomic) NSString* searchString;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [self setUpSearchBar];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    // Do any additional setup after loading the view.
}

- (void) setUpSearchBar {
    
    UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 80, 30)];
    testView.backgroundColor= [UIColor clearColor];
    self.navigationItem.titleView = testView;

    
    //WJSearchBar* searchBar = [[WJSearchBar alloc] initWithFrame:CGRectMake(-10, 0, [[UIScreen mainScreen] bounds].size.width - 80, 30)];
    
    __weak mainViewController* weakSelf = self;
    WJSearchBar* searchBar = [[WJSearchBar alloc] initWithFrame:CGRectMake(-10, 0, [[UIScreen mainScreen] bounds].size.width - 80, 30) withArray:@[@"全部",@"文章",@"课程",@"用户",@"我喜欢的",@"我的收藏",@"我的好友"] andSelectedBlock:^(id object) {
        
        NSLog(@"搜索分类为 %@",object);
        weakSelf.searchString = object;
        
    }];
    searchBar.delegate = self;
    self.searchBar = searchBar;
    [self.navigationItem.titleView  addSubview:searchBar];
}



- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    NSString* cateGoryString = self.searchString;
    NSString* content = searchBar.text;
    
    UIAlertView* alertVc = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"搜索分类为%@",cateGoryString] message:[NSString stringWithFormat:@"搜索内容为%@",content] delegate:nil cancelButtonTitle:nil  otherButtonTitles:@"知道了", nil];
     [alertVc show];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.searchBar resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
