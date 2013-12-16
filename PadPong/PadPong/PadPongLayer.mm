//
//  PadPongLayer.m
//  PadPong
//
//  Created by Justin Powell on 12/13/13.
//
//
// Pixel to Meter ratio for box2d
#define PTM_RATIO 32

#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "Paddle.h"
#import "PadPongLayer.h"

@implementation PadPongLayer

+ (id)scene {
    CCScene *scene = [CCScene node];
    PadPongLayer *layer = [PadPongLayer node];
    [scene addChild:layer];
    return scene;
}

// starting force is a vector (x,y)
+ (b2Vec2) getStartingForce{
    return b2Vec2(10,10);
}


- (id)init {
    if ((self=[super init])) {
        winSize = [CCDirector sharedDirector].winSize;
        
        [self setupWorld];
        [self setupGroundBody];
        [self addBackground];
        [self spawnScoreboards];
        [self setupBall];
        [self spawnPaddles];
        
        [self schedule:@selector(tick:)];
        [[[CCDirector sharedDirector] openGLView] setMultipleTouchEnabled:YES];
        
        self.isTouchEnabled = YES;
    }
    return self;
}

-(void)addBackground{
    CCSprite* lineSprite = [CCSprite spriteWithFile:@"line.png" rect:CGRectMake(0,0, 5, winSize.height*2)];
    lineSprite.position = ccp(winSize.width/2, 0);
    
    ccTexParams params = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
    [lineSprite.texture setTexParameters: &params];
    
    [self addChild: lineSprite];
}

- (void)setupWorld {
    // Create a world
    b2Vec2 gravity = b2Vec2(0.0f, 0.0f);
    bool doSleep = true;
    _world = new b2World(gravity, doSleep);
}

- (void)setupGroundBody {
    // Create edges around the entire screen
    b2BodyDef groundBodyDef;
    groundBodyDef.position.Set(0,0);
    _groundBody = _world->CreateBody(&groundBodyDef);
    b2PolygonShape groundBox;
    
    b2FixtureDef groundBoxDef;
    groundBoxDef.shape = &groundBox;
    groundBoxDef.friction = 0.0f;
    
    // top wall
    groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(winSize.width/PTM_RATIO, 0));
    _bottomFixture = _groundBody->CreateFixture(&groundBoxDef);
    
    // bottom wall
    groundBox.SetAsEdge(b2Vec2(0, winSize.height/PTM_RATIO), b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO));
    _groundBody->CreateFixture(&groundBoxDef);
}

- (void)spawnScoreboards{
    _leftScoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SquareHead" fontSize:64];
    _leftScoreLabel.position = ccp(winSize.width/2 - 100,winSize.height - 45);
    [self addChild: _leftScoreLabel];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(raiseLeftScore)
     name:@"LeftScores"
     object:nil ];
    
    _rightScoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SquareHead" fontSize:64];
    _rightScoreLabel.position = ccp(winSize.width/2 + 100,winSize.height - 45);
    [self addChild: _rightScoreLabel];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(raiseRightScore)
     name:@"RightScores"
     object:nil ];
}

-(void)raiseLeftScore{
    [_leftScoreLabel setString: [NSString stringWithFormat:@"%d",++_leftScore]];
    
}
-(void)raiseRightScore{
    [_rightScoreLabel setString: [NSString stringWithFormat:@"%d",++_rightScore]];
}

- (void)spawnPaddles{
    _leftPaddle = [[Paddle alloc] initWithWorld: _world: _groundBody: ccp(50,50): CGRectMake(0,0, winSize.width/2,winSize.height)];
    [self addChild:_leftPaddle.Sprite];
    
    _rightPaddle = [[Paddle alloc] initWithWorld: _world: _groundBody: ccp(winSize.width-50, 50): CGRectMake(winSize.width/2,0,winSize.width/2,winSize.height)];
    [self addChild:_rightPaddle.Sprite];
}

- (void) setupBall{
    _ball = [[Ball alloc] spawn:self :_world : _groundBody];
    [_ball respawnLeftOrRight];
}

- (void)tick:(ccTime) dt {
    _world->Step(dt, 10, 10);
    
    for(b2Body *b = _world->GetBodyList(); b; b=b->GetNext()) {
        CCSprite *sprite = (CCSprite *)b->GetUserData();
        
        if(sprite != NULL) {
            sprite.position = ccp(b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
        }
    }
}

- (void)dealloc {
    delete _world;
    _groundBody = NULL;
    [super dealloc];
}

@end
