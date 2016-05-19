//
//  LCEMainTabBarController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/18.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCEMainTabBarController.h"
#import "LCETextViewController.h"
#import "LCEPictureViewController.h"
#import "LCESoundViewController.h"
#import "LCEVideoViewController.h"
#import "UIImage+Original.h"

@interface LCEMainTabBarController ()

@end

@implementation LCEMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_back"];
    self.tabBar.selectionIndicatorImage=[UIImage imageNamed:@"tabbar_selected_back"];
    self.tabBar.tintColor = [UIColor whiteColor];
    [self setUpViewControllers];
}

- (void)setUpViewControllers {
    LCEPictureViewController *pictureVC = [[LCEPictureViewController alloc] init];
    UINavigationController *naviPic = [[UINavigationController alloc] initWithRootViewController:pictureVC];
    pictureVC.view.backgroundColor = [UIColor orangeColor];
    pictureVC.tabBarItem.title = @"图片";
    pictureVC.tabBarItem.image = [UIImage imageNamed:@"line_paint"];
    
    LCETextViewController *textVC = [[LCETextViewController alloc] init];
    UINavigationController *naviText = [[UINavigationController alloc] initWithRootViewController:textVC];
    textVC.view.backgroundColor = [UIColor blueColor];
    textVC.tabBarItem.title = @"文字";
    textVC.tabBarItem.image = [UIImage imageNamed:@"line_map"];
    
    LCEVideoViewController *videoVC = [[LCEVideoViewController alloc] init];
    UINavigationController *naviVideo = [[UINavigationController alloc] initWithRootViewController:videoVC];
    videoVC.view.backgroundColor = [UIColor greenColor];
    videoVC.tabBarItem.title = @"视频";
    videoVC.tabBarItem.image = [UIImage imageNamed:@"line_monitor"];
    
    LCESoundViewController *soundVC = [[LCESoundViewController alloc] init];
    UINavigationController *naviSound = [[UINavigationController alloc] initWithRootViewController:soundVC];
    soundVC.view.backgroundColor = [UIColor purpleColor];
    soundVC.tabBarItem.title = @"声音";
    soundVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_my_music"];
    
    self.viewControllers = @[naviPic, naviText, naviVideo, naviSound];
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
