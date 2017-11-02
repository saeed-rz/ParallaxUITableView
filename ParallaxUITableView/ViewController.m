//
//  ViewController.m
//  ParallaxUITableView
//
//  Created by Saeed on 5/2/17.
//  Copyright © 2017 saeed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define kDefaultHeaderFrame CGRectMake(0, 0, self.vwImageFrame.frame.size.width, self.vwImageFrame.frame.size.height)
#define kCommentCellFont  [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:14]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) Init
{
    self.bluredImageView = [[UIImageView alloc] initWithFrame:self.vwImageFrame.frame];
    //    self.bluredImageView.autoresizingMask = self.imgHeader.autoresizingMask;
    self.bluredImageView.alpha = 0.0f;
    [self.vwImageFrame addSubview:self.bluredImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        CGPoint offset = scrollView.contentOffset;
        
        if (offset.y > 0)
        {
            //            frame.origin.y = MAX(offset.y *kParallaxDeltaFactor, 0);
            
            self.bluredImageView.alpha =   1 / kDefaultHeaderFrame.size.height * offset.y * 2.0;
            //            self.clipsToBounds = YES;
        }
        else
        {
            CGFloat delta = 0.0f;
            CGRect rect = kDefaultHeaderFrame;
            delta = fabs(MIN(0.0f, offset.y));
            rect.origin.y -= delta;
            rect.size.height += delta;
            self.bluredImageView.frame = rect;
            //            self.bluredImage = nil;
            
            //            self.clipsToBounds = NO;
            //            self.headerTitleLabel.alpha = 1 - (delta) * 1 / kMaxTitleAlphaOffset;
        }
    
}

@end
