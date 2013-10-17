//
//  MADWebViewController.m
//  lab10
//
//  Created by Justin Powell on 10/17/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADWebViewController.h"

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
    _boulderWebView.delegate = self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebPageWithString: (NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_boulderWebView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_boulderSpinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating];
}
@end
