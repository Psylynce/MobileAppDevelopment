//
//  Ball.h
//  PadPong
//
//  Created by Justin Powell on 12/13/13.
//
//
#import "cocos2d.h"
#import "Box2D.h"
#import <Foundation/Foundation.h>

@interface Ball : NSObject {
    CGSize _winSize;
    CCSprite* Sprite;
    b2Body* Body;
    b2Fixture* Fixture;
}

@property(readonly,assign) CCSprite* Sprite;
@property(readonly,assign) b2Body* Body;
@property(readonly,assign) b2Fixture* Fixture;

-(id) spawn: (CCLayer*) layer: (b2World*) world: (b2Body*) groundBody;
-(void) respawnLeftOrRight;
-(void) respawnLeft;
-(void) respawnRight;
-(void)dealloc;

@end
