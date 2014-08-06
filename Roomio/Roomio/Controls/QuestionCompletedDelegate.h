//
//  QuestionCompletedDelegate.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionCompletedDelegate <NSObject>

-(void) questionCompleted:(BOOL) isQuestionValid;

@end
