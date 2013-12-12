//
//  Ball.m
//  Pong
//
//  Created by Justin Powell on 12/12/13.
//  Copyright (c) 2013 Justin Powell. All rights reserved.
//
#define RATIO 32
#import "Ball.h"
#import "CCScheduler.h"
#import <stdlib.h>

@implementation Ball
@synthesize Sprite, Body, Fixture;

-(id)spawn:(CCLayer *)layer :(b2World *)world :(b2Body *)groundBody{
    if((self = [super init])){
        _winSize = [CCDirector sharedDirector].winSize;
        
        // Create the sprite
        Sprite = [CCSprite spriteWithFile:@"whitedot.png" rect:CGRectMake(50, 50, 50, 50)];
        Sprite.position = ccp(500, 500);
        [layer addChild:Sprite];
        
        b2BodyDef bodyDef;
        bodyDef.type = b2_dynamicBody;
        bodyDef.position.Set(Sprite.position.x/RATIO, Sprite.position.y/RATIO);
        bodyDef.userData = Sprite;
        Body = world->CreateBody(&bodyDef);
        
        b2CircleShape shape;
        shape.m_radius = ([Sprite boundingBox].size.width/2)/RATIO;
        
        b2FixtureDef fixtureDef;
        fixtureDef.shape = &shape;
        fixtureDef.density = 1.0f;
        fixtureDef.friction = 0.1f;
        fixtureDef.restitution = 1.0f;
        Fixture = Body->CreateFixture(&fixtureDef);
        
        [[CCScheduler sharedScheduler] scheduleSelector:@selector(tick:) forTarget:self interval:0 paused:FALSE];
        
    }
    return self;
}

-(void)reset{
    float32 angle = Body->GetAngle();
    Body->SetLinearDamping(0);
    Body->SetAngularDamping(0);
    Body->SetAngularVelocity(0);
    Body->SetLinearVelocity(b2Vec2(0,0));
    b2Vec2 center = b2Vec2(_winSize.width/2/RATIO, _winSize.height/2/RATIO);
    Body->SetTransform(center, angle);
}

-(void)tick: (ccTime) dt {
    b2Vec2 ballPosition = Body->GetPosition();
    ballPosition *= RATIO;
    
    // Scoring
    if(ballPosition.x < 0){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RightScores" object:nil];
        [self respawnLeft];
    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LeftScores" object:nil];
        [self respawnRight];
    }
}

-(void)respawnLeftOrRight{
    int num = arc4random() % 2;
    if(num ==1){
        [self respawnLeft];
    }else{
        [self respawnRight];
    }
}

-(void)respawn: (float)withAngle{
    [self reset];
    const int speed = 35;
    double x = sin(withAngle * M_PI / 180) * speed;
    double y = cos(withAngle * M_PI / 180) * speed;
    b2Vec2 force = b2Vec2(x, y);
    Body->ApplyLinearImpulse(force, Body->GetPosition());
}

-(void)respawnLeft{
    int margin = 40;
    int num = arc4random() % (180 - margin);
    num += (180 - (margin / 2));
    [self respawn:num];
}

-(void)respawnRight{
    int margin = 40;
    int num = arc4random() % (180 - margin);
    num += (margin / 2);
    [self respawn:num];
}

-(void)dealloc{
    Sprite = NULL;
    Body = NULL;
    Fixture = NULL;
    [super dealloc];
}

@end
