//
//  _SkyPaw_OpenFeintDemoViewController.m
//  _SkyPaw_OpenFeintDemo
//
//  Created by Bau Bi on 31/05/10.
//  Copyright SkyPaw Co.,Ltd 2010. All rights reserved.
//

#import "_SkyPaw_OpenFeintDemoViewController.h"
#import "OFHighScoreController.h"

@implementation _SkyPaw_OpenFeintDemoViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

//*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    mLeaderBoardView = [[LeaderBoardView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self setView:mLeaderBoardView];
    [mLeaderBoardView release];
    
    OFHighScoreController* controller = [[OFHighScoreController alloc] init];
    [self.navigationController pushViewController:controller animated:NO];
}
//*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
