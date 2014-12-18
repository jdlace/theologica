//
//  MapDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/18/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "MapDetailViewController.h"

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController

- (void)viewDidLoad
{
    {
        [super viewDidLoad];
        
        // fit the our popover size to match our image size
        UIImageView *imageView = (UIImageView *)self.view;
        
        // this will determine the appropriate size of our popover
        self.preferredContentSize = CGSizeMake(imageView.image.size.width, imageView.image.size.height);
        self.title = @"Info";
        
        // for this view controller we want a black style nav bar
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    }
}

- (void)didReceiveMemoryWarning
{
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
