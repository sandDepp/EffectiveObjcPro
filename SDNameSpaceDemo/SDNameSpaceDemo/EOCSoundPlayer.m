//
//  EOCSoundPlayer.m
//  SDNameSpaceDemo
//
//  Created by 沙莎 on 16/9/19.
//  Copyright © 2016年 沙莎. All rights reserved.
//

#import "EOCSoundPlayer.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation EOCSoundPlayer
{
    SystemSoundID _systemSoundId;
}


void completion(SystemSoundID ssID, void  *clientData){
    
    EOCSoundPlayer *player = (__bridge EOCSoundPlayer*)clientData;
    
    if ([player.delegate respondsToSelector:@selector(soundPlayerDidFinish:)]) {
        [player.delegate soundPlayerDidFinish:player];
    }
}


- (id)initWithUrl:(NSURL *)url{
    if (self = [super init]) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &_systemSoundId);
    }
    return self;
}

- (void)playSound{
    
    AudioServicesAddSystemSoundCompletion(_systemSoundId,
                                          NULL,
                                          NULL,
                                          completion,
                                          (__bridge void*)self);
    
    AudioServicesPlaySystemSound(_systemSoundId);
}
@end
