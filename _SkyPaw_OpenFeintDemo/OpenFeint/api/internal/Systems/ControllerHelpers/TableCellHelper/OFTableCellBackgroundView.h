////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// 
///  Copyright 2009 Aurora Feint, Inc.
/// 
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///  
///  	http://www.apache.org/licenses/LICENSE-2.0
///  	
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
/// 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma once

#import <UIKit/UIKit.h>
#import "OFTableCellHelper.h"

@interface OFTableCellBackgroundView : UIView
{
	UIImage* mImage;
	OFTableCellRoundedEdge mEdgeStyle;
	BOOL mTileImage;
}

@property (nonatomic, retain) UIImage* image;
@property (nonatomic) OFTableCellRoundedEdge edgeStyle;
@property (nonatomic) BOOL tileImage;

+ (id)defaultBackgroundView;

- (id)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName andRoundedEdge:(OFTableCellRoundedEdge)roundedEdge;

@end
