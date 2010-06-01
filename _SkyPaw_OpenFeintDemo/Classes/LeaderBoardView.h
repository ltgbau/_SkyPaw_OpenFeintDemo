//
//  LeaderBoardView.h
//  _SkyPaw_OpenFeintDemo
//
//  Created by Bau Bi on 31/05/10.
//  Copyright 2010 SkyPaw Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenFeintDelegate.h"

#define RANDOM_SEED() srand(time(NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % ((__MAX__+1) - (__MIN__)))

@interface LeaderBoardView : UIView<OpenFeintDelegate> {

}

@end
