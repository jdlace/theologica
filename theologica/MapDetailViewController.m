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
        
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        
        
        //self.locationLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        self.locationDescription.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        self.locationSubtitle.font = [UIFont preferredFontForTextStyle: UIFontTextStyleSubheadline];
    
        _locationLabel.text = _currentWordDetail.name;
        _locationDescription.text = _currentWordDetail.definition;
        _locationSubtitle.text = _currentWordDetail.twitterDef; 
        _imageView.image = _currentWordDetail.image;

        
        //_twitterLabel.text = _currentWordDetail.twitterDef;
        
        
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(preferredContentSizeChanged:)
         name:UIContentSizeCategoryDidChangeNotification
         object:nil];

    
    self.locationDescription.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        /*
        CGSize size = _locationDescription.contentSize;
        CGRect frame = _locationDescription.frame;
        frame.size.height = size.height;
        
        _locationDescription.frame = frame;
        [_locationDescription sizeToFit];
        
        _scrollView.contentSize = CGSizeMake(_locationDescription.contentSize.width, _locationDescription.frame.size.height + 135);
    */
    self.textViewHeightConstraint.constant = [self.scrollView sizeThatFits:CGSizeMake(self.scrollView.frame.size.width, CGFLOAT_MAX)].height;
    /*
        // fit the our popover size to match our image size
        UIImageView *imageView = (UIImageView *)self.view;
        
        // this will determine the appropriate size of our popover
        self.preferredContentSize = CGSizeMake(imageView.image.size.width, imageView.image.size.height);
        //self.title = @"Info";
        
        // for this view controller we want a black style nav bar
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    */
    }
    
    self.locationDescription.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

-(IBAction)share:(UIBarButtonItem *)sender
{
    NSArray *activityItems;
    activityItems = @[self.currentWordDetail.name, self.currentWordDetail.definition];
    
    //NSArray *activityActions;
    
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    //Do something with the URL
    WebViewController *mapWebViewController = [[self storyboard]instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    NSString *webString = [URL absoluteString];
    
    mapWebViewController.urlString = webString;
    
     [self.navigationController pushViewController:mapWebViewController animated:YES];
    
    return NO;
}

/////orientation///////

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



/*
- (void) backButtonTapped:(id)sender
{
    [self.delegate resetMapView];
    
    [self.navigationController popViewControllerAnimated:YES];
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
