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
#import "WebViewController.h"

@interface WordDetailViewController () <UIActionSheetDelegate>

@property (strong, nonatomic) UIBarButtonItem *save;
@property (strong, nonatomic) UIBarButtonItem *share;

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
    
    self.save = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bookmarklines"] style:UIBarButtonItemStylePlain target:self action:@selector(saveBookmark)];
    
    self.share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:_share, _save, nil];
    
    [self bookmarkYES];

    //self.nameLabel.font = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.nameLabel.text = self.word.name;
    self.twitterLabel.text = self.word.twitterDef;
    self.descriptionTextView.text = self.word.definition;
    //_imageView.image = _currentWordDetail.image;
    //self.title = self.nameLabel.text;

    
    
    //dynamic type
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
    
    /*
    CGSize size = _descriptionTextView.contentSize;
    CGRect frame = _descriptionTextView.frame;
    frame.size.height = size.height;
    
    _descriptionTextView.frame = frame;
    [_descriptionTextView sizeToFit];
    
    _scrollView.contentSize = CGSizeMake(_descriptionTextView.contentSize.width, _descriptionTextView.frame.size.height + 145);
    */
    
    
    //added for Dynamic Type
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
    self.textViewHeightConstraint.constant = [self.scrollView sizeThatFits:CGSizeMake(self.scrollView.frame.size.width, CGFLOAT_MAX)].height;
    
    self.descriptionTextView.delegate = self;

    
 

}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    self.descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.twitterLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

-(void) saveBookmark
{
    self.word.bookmarked = @(![self.word.bookmarked boolValue]);
    [[TADataStore sharedStore] saveContext];
    [self bookmarkYES];
    
}

-(void) bookmarkYES;
{
    
    if ([_word.bookmarked boolValue])
        {
        self.save.image = [UIImage imageNamed:@"bookmarked"];
        }
    else
        {
        self.save.image = [UIImage imageNamed:@"bookmarklines"];
        }
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

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    //Do something with the URL
    WebViewController *sourcesWebViewController = [[self storyboard]instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    NSString *webString = [URL absoluteString];
    
    sourcesWebViewController.urlString = webString;
    
    [self.navigationController pushViewController:sourcesWebViewController animated:YES];
    
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
