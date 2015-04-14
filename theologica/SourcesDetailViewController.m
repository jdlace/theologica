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
    // Do any additional setup after loading the view.
   /*
    UIScrollView *scroll = self.scrollView;
    UIImageView *image = self.sourcesPic;
    scroll.translatesAutoresizingMaskIntoConstraints  = NO;
    image.translatesAutoresizingMaskIntoConstraints = NO;
    _sourceName.translatesAutoresizingMaskIntoConstraints = NO;
    _sourceInformation.translatesAutoresizingMaskIntoConstraints = NO;
    _sourcesPic.translatesAutoresizingMaskIntoConstraints = NO;
    _sourceSubtitle.translatesAutoresizingMaskIntoConstraints = NO;
    
   
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scroll, image);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scroll]|" options:0 metrics: 0 views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scroll]|" options:0 metrics: 0 views:viewsDictionary]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[image]|" options:0 metrics: 0 views:viewsDictionary]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[image]|" options:0 metrics: 0 views:viewsDictionary]];
*/
    
    _sourceName.text = _currentSourceDetail.name;
    _sourceSubtitle.text = _currentSourceDetail.twitterDef;
    _sourceInformation.text = _currentSourceDetail.comment;
    //_imageView.image = _currentSourceDetail.image;
    _sourcesPic.image = _currentSourceDetail.bigPic;
    //_scrollPic.image = _currentSourceDetail.scrollPic;
    
    self.sourceSubtitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.sourceInformation.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    [self.sourceInformation setTextColor:[UIColor darkGrayColor]];
   
    
    
/*
    CGRect frame = self.sourcesPic.frame;
    frame.origin = CGPointMake(0,0);
    self.sourcesPic.frame = frame;
    
    CGRect frame2 = self.sourceName.frame;
    frame2.origin = CGPointMake(0, 0);
    self.sourceName.frame = frame2;
 */
    //[self.sourceInformation addSubview:self.scrollPic];
    //[self.sourceInformation addSubview:self.sourceName];
    //[self.sourceInformation addSubview:self.sourcesPic];
    
    //CGRect convertedFrame = [_sourceInformation convertRect:_scrollPic.frame fromView:self.sourceInformation];
    //[[self.sourceInformation textContainer] setExclusionPaths:@[[UIBezierPath bezierPathWithRect:convertedFrame]]];
    
    //CGRect convertedFrame2 = [_sourceInformation convertRect:_sourceName.frame fromView:self.sourceInformation];
    //[[self.sourceInformation textContainer] setExclusionPaths:@[[UIBezierPath bezierPathWithRect:convertedFrame2]]];
    
   
    //images in detail view
    
    NSTextAttachment *scriptureAttachment1 = [[NSTextAttachment alloc] init];
    scriptureAttachment1.image = [UIImage imageNamed:@"codex"];
    scriptureAttachment1.bounds = CGRectMake(0, 0, scriptureAttachment1.image.size.width, scriptureAttachment1.image.size.height);
    
    //NSTextAttachment *scriptureAttachment2 = [[NSTextAttachment alloc] init];
    //scriptureAttachment2.image = [UIImage imageNamed:@"codex"];
    //scriptureAttachment2.bounds = CGRectMake(0, -45, scriptureAttachment2.image.size.width, scriptureAttachment2.image.size.height);
    
    //NSAttributedString *scriptureString1 = [NSAttributedString attributedStringWithAttachment:scriptureAttachment1];
    //NSAttributedString *scriptureString2 = [NSAttributedString attributedStringWithAttachment:scriptureAttachment2];

    
    //NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_currentSourceDetail.comment];
    
    //NSRange scriptureImgTag1 = [attributedString.string rangeOfString:@"<scriptureImg1>"];
    //NSRange scriptureImgTag2 = [_currentSourceDetail.comment rangeOfString:@"<scriptureImg2>"];

    
    //[attributedString replaceCharactersInRange:scriptureImgTag1  withAttributedString:scriptureString1];
    
    //[attributedString

    
    //[attributedString replaceCharactersInRange:scriptureImgTag2  withAttributedString:scriptureString2];

    
    
  

    
    CGSize size = _sourceInformation.contentSize;
    CGRect frame = _sourceInformation.frame;
    frame.size.height = size.height;
    
    _sourceInformation.frame = frame;
    [_sourceInformation sizeToFit];

    _scrollView.contentSize = CGSizeMake(_sourceInformation.contentSize.width, _sourceInformation.frame.size.height + 135);
    
    //added for Dynamic Type
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
    //[attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
    //[attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(0, attributedString.length)];

    
    //_sourceInformation.attributedText = attributedString;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
