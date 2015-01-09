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
    
    self.sourceSubtitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    
    self.sourceInformation.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]; 
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
