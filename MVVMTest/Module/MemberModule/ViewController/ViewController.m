//
//  ViewController.m
//  MVVMTest
//
//  Created by Allen on 2017/4/21.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "ViewController.h"
#import "PublicWeiboViewModel.h"

@interface ViewController ()
@property (strong, nonatomic)NSArray *publicModelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel setBlockWithReturnBlock:^(id returnValue) {
        _publicModelArray = returnValue;
    }];
    
    [publicViewModel fetchPublicWeibo];
   
    



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
