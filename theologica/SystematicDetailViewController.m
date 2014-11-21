//
//  SystematicDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SystematicDetailViewController.h"
#import "SystematicTableViewController.h"   

@interface SystematicDetailViewController () <UIActionSheetDelegate>

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
    
    //self.systematicName.font = [UIFont preferredFontForTextStyle: UIFontTextStyleBody];
    self.systematicDescription.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    _systematicName.text = _currentWordDetail.name;
    _systematicDescription.text = _currentWordDetail.definition;
    //_systematicDescription.textColor = [UIColor blacColor];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification {
    self.systematicDescription.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
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
