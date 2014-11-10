//
//  EcclesialDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "EcclesialDetailViewController.h"

@interface EcclesialDetailViewController ()

@end

@implementation EcclesialDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _ecclesialName.text = _currentWordDetail.name;
    _ecclesialDescription.text = _currentWordDetail.definition;
    _ecclesialDescription.textColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)share:(UIBarButtonItem *)sender
{
    NSArray *activityItems;
    activityItems = @[_currentWordDetail.name, _currentWordDetail.definition];
    
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];

    
}
@end
