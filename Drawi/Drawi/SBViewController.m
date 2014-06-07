//
//  SBViewController.m
//  Drawi
//
//  Created by damian on 05/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBViewController.h"
#import "GzColors.h"


@implementation SBViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
#pragma mark -
#pragma mark WEPopoverControllerDelegate implementation

- (void)popoverControllerDidDismissPopover:(WEPopoverController *)thePopoverController {
	//Safe to release the popover here
	self.wePopoverController = nil;
}

- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)thePopoverController {
	//The popover is automatically dismissed if you click outside it, unless you return NO here
	return YES;
}


#pragma mark -
#pragma mark Button event implementation

- (IBAction)buttonTapped:(id)sender {
    if (!self.wePopoverController) {
		
		ColorViewController *contentViewController = [[ColorViewController alloc] init];
        contentViewController.delegate = self;
		self.wePopoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
		self.wePopoverController.delegate = self;
//		self.wePopoverController.passthroughViews = [NSArray arrayWithObject:self.navigationController.navigationBar];
		
		[self.wePopoverController presentPopoverFromRect:((UIButton*)sender).frame
                                                  inView:self.view
                                permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown)
                                                animated:YES];
        
	} else {
		[self.wePopoverController dismissPopoverAnimated:YES];
		self.wePopoverController = nil;
	}
    
}

-(void) colorPopoverControllerDidSelectColor:(NSString *)hexColor{
    //self.view.backgroundColor = [GzColors colorFromHex:hexColor];
    //[self.view setNeedsDisplay];
    [self.wePopoverController dismissPopoverAnimated:YES];
    self.wePopoverController = nil;
    
    
    
    self.CanvasView.pencilColor=[GzColors colorFromHex:hexColor];
    [self.CanvasView setNeedsDisplay];

}

@end
