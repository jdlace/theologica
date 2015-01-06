//
//  SystematicDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "WordDetailViewController.h"

@interface WordDetailViewController () <UIActionSheetDelegate>

@end

@implementation WordDetailViewController

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
    
    //self.nameLabel.font = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    _nameLabel.text = _currentWordDetail.name;
    _twitterLabel.text = _currentWordDetail.twitterDef; 
    _descriptionTextView.text = _currentWordDetail.definition;
    //_systematicDescription.textColor = [UIColor blacColor];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//method for Action button - allows sharing

- (IBAction)share:(UIBarButtonItem *)sender
{
    NSArray *activityItems;
    activityItems = @[_currentWordDetail.name, _currentWordDetail.twitterDef, @"#theologica"];
    
    //NSArray *activityActions;
    

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
}

@end
