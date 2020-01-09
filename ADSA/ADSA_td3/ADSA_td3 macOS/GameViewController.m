//
//  GameViewController.m
//  ADSA_td3 macOS
//
//  Created by Mahamat Ismail Hour on 25/09/2018.
//  Copyright © 2018 Mahamat Ismail Hour. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GameScene *sceneNode = [GameScene newGameScene];
    
    // Present the scene
    SKView *skView = (SKView *)self.view;
    [skView presentScene:sceneNode];
    
    skView.ignoresSiblingOrder = YES;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
}

@end
