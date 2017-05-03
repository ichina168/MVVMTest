//
//  WebViewViewController.m
//  MVVMTest
//
//  Created by Allen on 2017/5/3.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()
{
    WebModel *webModel;
}
@end

@implementation WebViewViewController
- (void)NavigateTo:(id)param withFromClassName:(Class)c{
    webModel = param;
}

- (void)NavigateBack:(id)param withFromClassName:(Class)c{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.frame];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webModel.responseData.url]]];
    [self.view addSubview:view];
   
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
