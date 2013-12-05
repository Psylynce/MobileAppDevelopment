## Project 1 Plan

### Unit Converter

I plan on making a unit converter for Project 1. This will convert measurements of distance only. So cm, m, km, etc. The user will choose which units they need to convert and what units they want to convert their number to and the app will do the work. It will also list off some other measurements below for the user to see if they need them.

<br/>
--------------
<br/>

Project 2 Plan
==============

### My Places App

**Overview**

I will be developing an app that lets you record what places you have visited and marks them on a map. You will enter in some information, like where you have been; city, country, or continent, and it will mark places on a map view. Once they are marked the user will be able to select a certain location and get information about it via a web view.

The app will just let you select cities, unless it makes it easy to choose arenas or what have you. But I want users to be able to choose which cities they have been to and it will update the map with a pin on that city, if they zoom out it will be on the country, and zoom out even more it will show the continent. I may also keep track of how many places the user has been in a given country or continent.

**Pseudocode**

```objective-c
	NSString *userName;
	NSMutableArray *userPlaces;
	// MAPKit methods that I will need
	// WebView methods that I will need
```

* Get user's name
* let the user input the places they have visited
* push those places onto the array
* get the array data and fill the map with tags
* when the user clicks on tags show popup with wikipedia link to specific place
* when user clicks link to the wikipedia page open a web view with the appropriate content

**Visual Reference**

![App View](http://i.telegraph.co.uk/multimedia/archive/02346/man_united_2346638k.jpg)

This will be the basic layout for the map view with the pins on the map. The popup will bring the user to a wiki page about that specific place.

**Test**

To test this I will be entering in data that should not exist on a map, such as just numbers that aren't lattitude or longitude, I may let the user enter those if they wish. I will also make sure the right wiki pages are assigned to the correct pins. 
<br><br>

Project 3 Plan
==============
###Pong

**Overview**

I will be building an app that lets a user play against a computer in a game of Pong. It will be basically like the original game. I will implement the paddles, the ball and the scoreboard in the app. The frameworks I will use will be Cocos2d and Box2d. These two frameworks should provide me with the tools I need to complete this game.

**Pseudocode** 

```objective-c
	@interface Paddle : NSObject <CCTargetedTouchDelegate> {
		b2World *World;
		b2Body *Body;
		CCSprite *Sprite;
		b2Fixture *Fixture;
		b2MouseJoint *_mouseJoint;
		CGRect _touchArea;
	}
	@interface Ball : NSObject  {
		CGSize _winSize;
		CGSprite *Sprite;
		b2Body *Body;
		b2Fixture *Fixture;
	}
	@propertiey(readonly, assign) CGSprite *Sprite;
	@propertiey(readonly, assign) b2Body *Body;
	@propertiey(readonly, assign) b2Fixture *Fixture;
```

I will also be creating other properties and functions for whatever I need, this is just a start. 

**Visual Reference**

It will look similar to this.

![App View 1](http://blogs.msdn.com/cfs-filesystemfile.ashx/__key/communityserver-blogs-components-weblogfiles/00-00-01-11-92/7674.Pong.jpg)

**Testing**

To test I will create the paddles and make sure that the user can move the user paddle. Then I will add the ball and make sure that Box2d will create a world in which it will interact. I will make sure the ball resets in the same spot every time and will hit the top and bottom of the screen and exit on the sides. Once I have all that done I will implement scoring and make sure that it works correctly, once the game is won it should display a message with a reset button so that the user can play again.