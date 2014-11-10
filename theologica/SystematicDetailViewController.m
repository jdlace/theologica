//
//  SystematicDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SystematicDetailViewController.h"

@interface SystematicDetailViewController ()

@end

@implementation SystematicDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _systematicName.text = _currentWordDetail.name;
    _systematicDescription.text = _currentWordDetail.definition;
    _systematicDescription.textColor = [UIColor blackColor];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)systemShare:(UIBarButtonItem *)sender
{
    
}

@end
