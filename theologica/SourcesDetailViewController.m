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
    
    _sourceName.text = _currentSourceDetail.name;
    _sourceSubtitle.text = _currentSourceDetail.twitterDef;
    _sourceInformation.text = _currentSourceDetail.comment;
    _imageView.image = _currentSourceDetail.image;
    _sourcesPic.image = _currentSourceDetail.bigPic;
    _scrollPic.image = _currentSourceDetail.scrollPic; 
    
    self.sourceSubtitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.sourceInformation.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
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
    
   
    
    NSTextAttachment *textAttachmentOne = [[NSTextAttachment alloc] init];textAttachmentOne.image = [UIImage imageNamed:@"dss"];textAttachmentOne.bounds = CGRectMake(0, -3, textAttachmentOne.image.size.width, textAttachmentOne.image.size.height);
    
        NSAttributedString *statOneAttribWithImage = [NSAttributedString attributedStringWithAttachment:textAttachmentOne];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_currentSourceDetail.comment];
    
    NSRange imgTag = [_currentSourceDetail.comment rangeOfString:@"<img>"];
    
    [attributedString replaceCharactersInRange:imgTag  withAttributedString:statOneAttribWithImage];
    
    _sourceInformation.attributedText = attributedString;
    
    CGSize size = _sourceInformation.contentSize;
    CGRect frame = _sourceInformation.frame;
    frame.size.height = size.height;
    
    _sourceInformation.frame = frame;
    _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width, size.height + 120); 
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
