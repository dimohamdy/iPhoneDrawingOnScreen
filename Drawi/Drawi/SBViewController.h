//
//  SBViewController.h
//  Drawi
//
//  Created by damian on 05/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Canvas.h"

@interface SBViewController : UIViewController

@property (strong, nonatomic) IBOutlet Canvas *CanvasView;

@end
