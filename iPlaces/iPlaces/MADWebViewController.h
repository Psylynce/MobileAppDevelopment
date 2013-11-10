//
//  MADWebViewController.h
//  iPlaces
//
//  Created by Justin Powell on 11/9/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADWebViewController : UIViewController
@property(weak, nonatomic) NSString *urlPath;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
