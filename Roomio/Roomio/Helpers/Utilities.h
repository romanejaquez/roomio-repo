//
//  Utilities.h
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface Utilities : NSObject

+(UIColor*) GetGreenColor;
+(NSString*) GetKinveyAppSecret;
+(NSString*) GetKinveyAppKey;
+(ChoiceType) GetChoiceTypeFromString:(NSString*) choiceString;

@end
