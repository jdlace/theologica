//
//  SourcesDetailViewController.m
//  theologica
//
//  Created by Jonathan Lace on 1/7/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "SourcesDetailViewController.h"

@interface SourcesDetailViewController ()

@end

@implementation SourcesDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sourceName.text = _currentSourceDetail.name;
    _sourceSubtitle.text = _currentSourceDetail.twitterDef;
    _sourceInformation.text = _currentSourceDetail.comment;
    //_imageView.image = _currentSourceDetail.image;
    _sourcesPic.image = _currentSourceDetail.bigPic;
    //_scrollPic.image = _currentSourceDetail.scrollPic;
    
    self.sourceSubtitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.sourceInformation.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    [self.sourceInformation setTextColor:[UIColor blackColor]];
   
    
    self.textViewHeightConstraint.constant = [self.sourceInformation sizeThatFits:CGSizeMake(self.sourceInformation.frame.size.width, self.sourceInformation.frame.size.height)].height;
    
    self.sourceInformation.delegate = self;
    
  
    ////////////////////////images in detail view
    
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = self.currentSourceDetail.scrollPic;
    
    //NSTextAttachment *imageAttachment2 = [[NSTextAttachment alloc] init];
    //imageAttachment.image = self.currentSourceDetail.scrollPic2;

    
    NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    //NSAttributedString *imageString2 = [NSAttributedString attributedStringWithAttachment:imageAttachment2];
    

    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_currentSourceDetail.comment];
    
    NSRange imgTag = [_sourceInformation.text rangeOfString:@"<img>"];
    //NSRange imgTag2 = [_sourceInformation.text rangeOfString:@"<pic>"];

    [attributedString replaceCharactersInRange:imgTag  withAttributedString:imageString];
    //[attributedString replaceCharactersInRange:imgTag2 withAttributedString:imageString2];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
     
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, attributedString.length)];
    
    //center justify the text
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
    [paragraphStyle setAlignment:NSTextAlignmentJustified];
    [paragraphStyle setLineSpacing:2.0];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];

    _sourceInformation.attributedText = attributedString;

    
    //added for Dynamic Type
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    self.sourceInformation.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.sourceSubtitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}


- (IBAction)shareButton:(id)sender {

    NSArray *activityItems;
    activityItems = @[self.currentSourceDetail.name, self.currentSourceDetail.twitterDef, self.currentSourceDetail.comment];
    
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
    
    //[self.navigationController pushViewController:sourcesWebViewController animated:YES];
    
    //UINavigationController *sourcesWebNavController = [[UINavigationController alloc] initWithRootViewController:sourcesWebViewController];
    
    [self.navigationController pushViewController:sourcesWebViewController animated:YES];
    
    //[self presentViewController:sourcesWebNavController animated:YES completion:nil];
    
    return NO;
}
@end
