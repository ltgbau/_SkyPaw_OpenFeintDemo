//
//  LeaderBoardView.mm
//  _SkyPaw_OpenFeintDemo
//
//  Created by Bau Bi on 31/05/10.
//  Copyright 2010 SkyPaw Co.,Ltd. All rights reserved.
//

#import "LeaderBoardView.h"
#import "OFHighScoreService.h"
#import "OFPaginatedSeries.h"
#import "OFTableSectionDescription.h"
#import "OFHighScore.h"
#import "OFUser.h"
#import "OpenFeint.h"

@implementation LeaderBoardView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        UIButton* btn;
        
        // load high score button
        btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake((320-200)/2, 20, 200, 30)];
        [btn setTitle:@"Load Local Highscore" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(onLoadLocalHighscore) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];

        btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake((320-200)/2, 50, 200, 30)];
        [btn setTitle:@"Load Online Highscore" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(onLoadOnlineHighscore) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake((320-200)/2, 80, 200, 30)];
        [btn setTitle:@"Submit Score" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(onSubmitLocalScore) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];

        btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake((320-200)/2, 110, 200, 30)];
        [btn setTitle:@"Show Dashboard" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(onShowDashboard) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UITextView* tv = [[UITextView alloc] initWithFrame:CGRectMake(0, 141, 320, 480-141)];
        [tv setTag:111];
        [tv setEditable:NO];
        [tv setBackgroundColor:[UIColor blackColor]];
        [tv setTextColor:[UIColor greenColor]];
        [self addSubview:tv];
        [tv release];
    }
    return self;
}

-(void)onSubmitScore
{
    UITextView* tv = (UITextView*)[self viewWithTag:111];
    [tv setText:@"Submitting..."];
    RANDOM_SEED();
    for(int i=0; i<100; i++)
    {
        NSInteger score = RANDOM_INT(100, 9999);
        [OFHighScoreService setHighScore:score forLeaderboard:@"365993" onSuccess:OFDelegate() onFailure:OFDelegate()];
    }
    [tv setText:@"Done!"];
}

-(void)onShowDashboard
{
    [OpenFeint launchDashboard];
}

-(void)onLoadLocalHighscore
{
    [OFHighScoreService getLocalHighScores:@"365993" onSuccess:OFDelegate(self, @selector(_scoresDownloaded:)) onFailure:OFDelegate(self, @selector(_failedDownloadingScores))];
}

-(void)onLoadOnlineHighscore
{
    UITextView* tv = (UITextView*)[self viewWithTag:111];
    [tv setText:@"Loading..."];

    [OFHighScoreService getPage:1 forLeaderboard:@"365993" friendsOnly:NO silently:YES onSuccess:OFDelegate(self, @selector(_scoresDownloaded:)) onFailure:OFDelegate(self, @selector(_failedDownloadingScores))];
}

-(BOOL)canReceiveCallbacksNow
{
    return YES;
}

- (void)_scoresDownloaded:(OFPaginatedSeries*)page
{
    NSMutableArray* highscores = nil;
    
    if ([page count] > 0)
    {
        if ([[page objectAtIndex:0] isKindOfClass:[OFTableSectionDescription class]])
        {
            // NOTE: In the following line, we access "[page objectAtIndex:1]" to retrieve high scores from
            // the global leaderboard.  Using "[page objectAtIndex:0]" would retrieve scores just for the local player.
            // Older versions of OpenFeint did not break this out into 2 sections.
            highscores = [(OFTableSectionDescription*)[page objectAtIndex:0] page].objects;
        }
        else
        {
            highscores = page.objects;
        }
    }
    
    NSMutableString* sTable = [[NSMutableString alloc] initWithString:@""];
    for (OFHighScore* score in highscores)
    {
        [sTable appendFormat:@"Rank: %d \nName: %@ \nScore: %qi\n", score.rank, score.user.name, score.score];
    }
    if([sTable isEqualToString:@""])
        [sTable setString:@"No data..."];
    UITextView* tv = (UITextView*)[self viewWithTag:111];
    [tv setText:sTable];
    [sTable release];
}

-(void)_failedDownloadingScores
{
    UITextView* tv = (UITextView*)[self viewWithTag:111];
    [tv setText:@"_failedDownloadingScores"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
