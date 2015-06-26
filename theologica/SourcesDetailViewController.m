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
    
    [self.sourceInformation setTextColor:[UIColor darkGrayColor]];
   
    
    self.textViewHeightConstraint.constant = [self.sourceInformation sizeThatFits:CGSizeMake(self.sourceInformation.frame.size.width, self.sourceInformation.frame.size.height)].height;
    
    self.sourceInformation.delegate = self;
    
  
    //images in detail view
   /*
    NSTextAttachment *scriptureAttachment1 = [[NSTextAttachment alloc] init];
    scriptureAttachment1.image = [UIImage imageNamed:@"dss-1"];
    //scriptureAttachment1.bounds = CGRectMake(0, 0, scriptureAttachment1.image.size.width, scriptureAttachment1.image.size.height);
    
    NSTextAttachment *scriptureAttachment2 = [[NSTextAttachment alloc] init];
    scriptureAttachment2.image = [UIImage imageNamed:@"codex"];
    //scriptureAttachment2.bounds = CGRectMake(0, -45, scriptureAttachment2.image.size.width, scriptureAttachment2.image.size.height);
    
    NSTextAttachment *magisteriumAttachment = [[NSTextAttachment alloc] init];
    magisteriumAttachment.image = [UIImage imageNamed:@"vatican"];
    
    NSAttributedString *scriptureString1 = [NSAttributedString attributedStringWithAttachment:scriptureAttachment1];
    NSAttributedString *scriptureString2 = [NSAttributedString attributedStringWithAttachment:scriptureAttachment2];
    //NSAttributedString *magisteriumString = [NSAttributedString attributedStringWithAttachment:magisteriumAttachment];

    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_currentSourceDetail.comment];
    
    NSRange scriptureImgTag1 = [_sourceInformation.text rangeOfString:@"<scriptureImg1>"];
    NSRange scriptureImgTag2 = [_sourceInformation.text rangeOfString:@"<scriptureImg2>"];
    //NSRange magisteriumImgTag = [_sourceInformation.text rangeOfString:@"<magisteriumImgTag>"];

    [attributedString replaceCharactersInRange:scriptureImgTag1  withAttributedString:scriptureString1];
    [attributedString replaceCharactersInRange:scriptureImgTag2  withAttributedString:scriptureString2];
    //[attributedString replaceCharactersInRange:magisteriumImgTag withAttributedString:magisteriumString];

    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, attributedString.length)];

    _sourceInformation.attributedText = attributedString;
    */
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
    SourcesWebViewController *sourcesWebViewController = [[self storyboard]instantiateViewControllerWithIdentifier:@"SourcesWebViewController"];
    
    NSString *webString = [URL absoluteString];
    
    sourcesWebViewController.urlString = webString;
    
    [self presentViewController:sourcesWebViewController animated:YES completion:nil];
    
    return NO;
}
@end
