//
//  CustomTabsViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/12/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "CustomTabsViewController.h"

@interface CustomTabsViewController ()

@end

@implementation CustomTabsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSUInteger)supportedInterfaceOrientations
{
    if (self.selectedViewController)
        return [self.selectedViewController supportedInterfaceOrientations];
    
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate
{
    return YES;
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
