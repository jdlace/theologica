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
    
    self.textScroll.contentSize = CGSizeMake(280, 300);
    self.textScroll.scrollEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
