//
//  QuestionModel.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface QuestionModel : NSObject

@property (nonatomic) int Id;
@property (nonatomic, strong) NSString *Title;
@property (nonatomic) ChoiceType Type;
@property (nonatomic, strong) NSMutableArray *Choices;

@end
