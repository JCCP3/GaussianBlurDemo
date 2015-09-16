//
//  ViewController.m
//  GaussianBlurDemo
//
//  Created by JC_CP3 on 15/9/16.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "ViewController.h"
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    UIVisualEffectView *visualEffectView;
}

@end

@implementation ViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 64.f)];
    headerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:headerView];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
    [imageView setImage:[UIImage imageNamed:@"Apprecommend.jpg"]];
    [self.view addSubview:imageView];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"UIVisualEffect",@"CoreImage"]];
    [segmentControl setFrame:CGRectMake((MainScreenWidth-150)/2, 25, 150, 30)];
    [segmentControl addTarget:self action:@selector(onClickSegment:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    [self onClickSegment:segmentControl];
    [self.view addSubview:segmentControl];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segmentAction
- (void)onClickSegment:(id)sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            [self showFirstStyleBlur];
            break;
            
        case 1:
            [self showSecondStyleBlur];
            break;
            
        default:
            break;
    }
}

//使用UIVisualEffectView实现
- (void)showFirstStyleBlur
{
    UIVisualEffect *blurEffect= [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    if (!visualEffectView) {
        visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView.frame = self.view.bounds;
        [self.view addSubview:visualEffectView];
    }
}

- (void)showSecondStyleBlur
{
    if (visualEffectView) {
        [visualEffectView removeFromSuperview];
        visualEffectView = nil;
    }

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
