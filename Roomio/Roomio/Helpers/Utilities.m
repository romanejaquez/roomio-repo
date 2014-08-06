//
//  Utilities.m
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(UIColor*) GetGreenColor {
    return [UIColor colorWithRed:38.0/255 green:169.0/255 blue:8.0/255 alpha:1.0];
}

+(NSString*) GetKinveyAppSecret {
    return @"d193d0982b534168a9e117926bd98c52";
}

+(NSString*) GetKinveyAppKey {
    return @"kid_VeUm6aV0si";
}

+(ChoiceType) GetChoiceTypeFromString:(NSString *)choiceString {
    
    ChoiceType type;
    if ([choiceString isEqualToString:@"YesNo"]) {
        type = YesNo;
    }
    else if ([choiceString isEqualToString:@"SingleChoice"]){
        type = SingleChoice;
    }
    else if ([choiceString isEqualToString:@"MultipleChoice"]){
        type = MultipleChoice;
    }
    
    return type;
}

@end
