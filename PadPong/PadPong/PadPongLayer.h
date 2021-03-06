//
//  PadPongLayer.h
//  PadPong
//
//  Created by Justin Powell on 12/13/13.
//
//
#import "cocos2d.h"
#import "Box2D.h"
#import "Paddle.h"
#import "Ball.h"
#import "GLES-Render.h"
#import "CCLayer.h"

@interface PadPongLayer : CCLayer {
    b2MouseJoint *_mouseJoint;
    b2World *_world;
    b2Body *_groundBody;
    b2Fixture *_bottomFixture;
    b2Fixture *_ballFixture;
    Paddle *_leftPaddle;
    Paddle *_rightPaddle;
    Ball *_ball;
    
    int _leftScore;
    int _rightScore;
    
    CCLabelTTF *_leftScoreLabel;
    CCLabelTTF *_rightScoreLabel;
    
    CGSize winSize;
}

+ (id) scene;
+ (b2Vec2) getStartingForce;

- (void) setupWorld;
- (void)setupGroundBody;
- (void) setupBall;
- (void)spawnPaddles;

@end
