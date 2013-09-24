//
//  MADViewController.m
//  browser
//
//  Created by Justin Richard Powell on 9/24/13.
//  Copyright (c) 2013 Justin Richard Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _webView.delegate = self;
    [self loadWebpageWithString:@"http://www.colorado.edu/"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebpageWithString:(NSString *) urlString{
//    This function takes a string, converts it to a url, then makes that url a request, then loads the url on the webview
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
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

- (IBAction)bookmarksTapped:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"TAM", @"CU Athletics", @"Engineering", nil];
    [actionSheet showFromToolbar:_toolbar];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self loadWebpageWithString:@"http://tam.colorado.edu/"];
    }
    else if (buttonIndex == 1){
        [self loadWebpageWithString:@"http://cubuffs.com/"];
    }
    else if (buttonIndex == 2){
        [self loadWebpageWithString:@"http://www.colorado.edu/engineering/home-page"];
    }
}
@end
