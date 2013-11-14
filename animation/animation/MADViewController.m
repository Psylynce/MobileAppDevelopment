//
//  MADViewController.m
//  animation
//
//  Created by Justin Powell on 11/14/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController (){
    CGPoint delta;
    CGPoint translation;
    NSTimer *timer;
    float radius;
    float angle;
}
@end

@implementation MADViewController

-(IBAction)changeSliderValue{
    _sliderLabel.text = [NSString stringWithFormat:@"%.2f", _slider.value];
    timer = [NSTimer scheduledTimerWithTimeInterval:_slider.value target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)viewDidLoad
{
    radius = _imageView.frame.size.width/2;
    delta = CGPointMake(12.0, 4.0);
    translation = CGPointMake(0.0, 0.0);
    angle = 0.0;
    [self changeSliderValue];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)onTimer{
    if(_imageView.center.x > self.view.bounds.size.width - radius || _imageView.center.x < radius){
        delta.x = -delta.x;
    }
    if(_imageView.center.y > self.view.bounds.size.height - radius || _imageView.center.y < radius){
        delta.y = -delta.y;
    }
    [UIView beginAnimations:@"my_animation" context:nil];
    [UIView animateWithDuration:_slider.value delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _imageView.center = CGPointMake(_imageView.center.x + delta.x, _imageView.center.y + delta.y);
        _imageView.transform = CGAffineTransformMakeRotation(angle);
//        _imageView.transform = CGAffineTransformMakeScale(angle, angle);
        angle += .05;
        if(angle > 2*M_PI) angle = 0;
    } completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [timer invalidate];
    [self changeSliderValue];
}
@end
