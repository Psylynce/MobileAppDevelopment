#define PTM_RATIO 32

#import "cocos2d.h"
#import "Box2D.h"
#import "Paddle.h"

@implementation Paddle
@synthesize Sprite, Body, Fixture;

-(id) initWithWorld: (b2World*) world: (b2Body*) groundBody: (CGPoint) startPosition: (CGRect) touchArea {
    if ((self=[super init])) {
        World = world;
        Ground = groundBody;
        _touchArea = touchArea;
        
        
        Sprite = [CCSprite spriteWithFile:@"whitedot.png"
                                     rect:CGRectMake(50, 50, 50, 150)];
        
        Sprite.position = startPosition;
        
        
        b2BodyDef bodyDef;
        bodyDef.type = b2_dynamicBody;
        bodyDef.linearDamping = 0.0f;
        bodyDef.angularDamping = 0.1f;
        bodyDef.position.Set(Sprite.position.x/PTM_RATIO,
                             Sprite.position.y/PTM_RATIO);
        bodyDef.userData = Sprite;
        Body = world->CreateBody(&bodyDef);
        
        b2PolygonShape paddleShape;
        paddleShape.SetAsBox(Sprite.contentSize.width/PTM_RATIO/2,
                             Sprite.contentSize.height/PTM_RATIO/2);
        
        b2FixtureDef shapeDef;
        shapeDef.shape = &paddleShape;
        shapeDef.density = 5.0f;
        shapeDef.friction = 10.0f;
        shapeDef.restitution = 0.1f;
        Fixture = Body->CreateFixture(&shapeDef);
        
        // Restrict paddle along the x axis.
        // Sidenote: a prismatic joint provides one
        // degree of freedom: translation along an axis
        // fixed relative to the first body.
        b2PrismaticJointDef jointDef;
        b2Vec2 worldAxis(0.0f, 1.0f);
        jointDef.collideConnected = true;
        jointDef.Initialize(Body, groundBody,
                            Body->GetWorldCenter(), worldAxis);
        world->CreateJoint(&jointDef);
        
        // Register touch events.
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1 swallowsTouches:YES];
    }
    return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    BOOL touched = NO;
    
    // When there already is an active
    // joint, ignore this touch.
    if (_mouseJoint != NULL) return touched;
    
    // Calculate the world location.
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    b2Vec2 locationWorld = b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO);
    
    // Only count is as a touch when the point lies
    // without our touch area.
    // Sidenote: there is one touch area for every paddle.
    touched = CGRectContainsPoint(_touchArea, location);
    
    if (touched) {
        // Since there is a hit.
        // Create a mouse joint that
        // allows us to attrack the padde
        // to a certain point.
        b2MouseJointDef jointDef;
        jointDef.bodyA = Ground;
        jointDef.bodyB = Body;
        jointDef.target = locationWorld;
        jointDef.collideConnected = true;
        jointDef.maxForce = 3000 * Body->GetMass();
        
        _mouseJoint = (b2MouseJoint *)World->CreateJoint(&jointDef);
        Body->SetAwake(true);
    }
    
    return touched;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    if (_mouseJoint == NULL) return;
    
    // location.
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    b2Vec2 locationWorld = b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO);
    
    // Set the target of the joint to the world location.
    // This makes the paddle move to that point.
    _mouseJoint->SetTarget(locationWorld);
    
}

-(void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    [self destroyActiveMouseJoint];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    [self destroyActiveMouseJoint];
}

-(void)destroyActiveMouseJoint{
    if (_mouseJoint) {
        World->DestroyJoint(_mouseJoint);
        _mouseJoint = NULL;
    }
}

-(void)dealloc{
    Sprite = NULL;
    Body = NULL;
    Fixture = NULL;
    
    [super dealloc];
}
@end