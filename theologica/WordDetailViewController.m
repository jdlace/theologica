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
    
    UIBarButtonItem *shareBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bookmarklines"] style:UIBarButtonItemStylePlain target:self action:@selector(saveBookmark)];
    
    /*
    if (saveBarButtonItem.target)
        {
        saveBarButtonItem.tintColor = [UIColor blueColor];
        }
     */
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:shareBarButtonItem, saveBarButtonItem, nil];

    //self.nameLabel.font = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    _nameLabel.text = _currentWordDetail.name;
    _twitterLabel.text = _currentWordDetail.twitterDef;
    _descriptionTextView.text = _currentWordDetail.definition;
    //_imageView.image = _currentWordDetail.image;
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
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

-(NSString *) filePath
{
    NSArray *pathToPlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *pathDirectory = [pathToPlist objectAtIndex:0];
    
    return [pathDirectory stringByAppendingPathComponent:@"Bookmarks.plist"];
}

-(void) saveToPlist
{
    NSMutableDictionary *myBookmarks = [NSMutableDictionary new];
    NSString *value = _nameLabel.text;
    [myBookmarks setValue:value forKey:@"Term"];
    [myBookmarks writeToFile:[self filePath] atomically:YES];
    
    NSLog(@"Term saved!");
}


-(void) saveBookmark
{
    [self saveToPlist];
    
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
    activityItems = @[_currentWordDetail.name, _currentWordDetail.twitterDef];
    
    //NSArray *activityActions;
    

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
}

@end
