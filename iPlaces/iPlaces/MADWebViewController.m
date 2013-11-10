//
//  MADWebViewController.m
//  iPlaces
//
//  Created by Justin Powell on 11/9/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADWebViewController.h"
#import "MADSecondViewController.h"

@interface MADWebViewController ()

@end

@implementation MADWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //_webView.delegate = self;
    [self loadPageWithString:_urlPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadPageWithString:(NSString *)urlString{
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@",urlString]]]];
}


@end
