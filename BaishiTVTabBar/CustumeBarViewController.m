
//
//  CustumeBarViewController.m
//  BaishiTVTabBar
//
//  Created by 李赛 on 16/2/18.
//  Copyright © 2016年 李赛. All rights reserved.
//

#import "CustumeBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface CustumeBarViewController ()

@end

@implementation CustumeBarViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    for (int i=0; i<10; i++) {
        FirstViewController *vc1=[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
        SecondViewController *vc2=[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        if (i%2) {
             [self addChildViewController:vc1];
        }else
        {
            [self addChildViewController:vc2];
        }
    }
   
    // Do any additional setup after loading the view.
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
