//
//  SystematicDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "WordDetailViewController.h"
#import "TADataStore.h"
#import "TAWord.h"

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
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:saveBarButtonItem,shareBarButtonItem, nil];

    //self.nameLabel.font = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.nameLabel.text = self.word.name;
    self.twitterLabel.text = self.word.twitterDef;
    self.descriptionTextView.text = self.word.definition;
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

//-(NSString *) filePath
//{
//    NSArray *pathToPlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *pathDirectory = [pathToPlist objectAtIndex:0];
//    
//    return [pathDirectory stringByAppendingPathComponent:@"Bookmarks.plist"];
//}
//
//-(void) saveToPlist
//{
//    NSMutableDictionary *myBookmarks = [NSMutableDictionary new];
//    NSString *value = _nameLabel.text;
//    [myBookmarks setValue:value forKey:@"Term"];
//    [myBookmarks writeToFile:[self filePath] atomically:YES];
//    
//    NSLog(@"Term saved!");
//}


-(void) saveBookmark
{
    self.word.bookmarked = @(![self.word.bookmarked boolValue]);
    [[TADataStore sharedStore] saveContext];
    
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
    activityItems = @[self.word.name, self.word.twitterDef];
    
    //NSArray *activityActions;
    

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
}

@end
