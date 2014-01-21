//
//  AdContainerViewController.h
//  MatchingGame
//
//  Created by Dhruval's MacBook on 1/21/14.
//  Copyright (c) 2014 Dhruval Darji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface AdContainerViewController : UIViewController <ADBannerViewDelegate>
{
    ADBannerView *adView;
    
}


@end
