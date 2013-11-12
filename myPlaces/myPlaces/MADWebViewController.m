//
//  MADWebViewController.m
//  myPlaces
//
//  Created by Justin Powell on 11/10/13.
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
    _webView.delegate = self;
    [self loadPageWithString:_urlPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadPageWithString:(NSString *)urlString{
    if ([urlString isEqualToString:@"Boulder"]) {
        NSString *boulderString = @"Boulder,_Colorado";
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", boulderString]]]];
    }
    else{
        NSString *newURL = [_urlPath stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", newURL]]]];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_spinner stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error Loading Web Page." message:[error localizedDescription] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alert show];
}

@end
