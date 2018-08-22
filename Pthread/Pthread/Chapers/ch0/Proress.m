//
//  Proress.m
//  Pthread
//
//  Created by Stephanie on 2018/8/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "Proress.h"

#import <unistd.h>

@implementation Proress

#pragma mark- LifeCicle
- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark- SetUpView

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (void)printPID {
     //获取进程ID
     NSLog(@"The ProcessID: %d",getpid());
}
- (void)printPPID {
    //获取父进程ID
     NSLog(@"The Parent ProcessID: %d",getppid());
}
- (void)printGID {
    //根据PID获取进程所属组别号,参数为 0 返回当前进程组别号
    NSLog(@"The Group Id :%d",getpgid(0));
    //获取当前进程组识别号
    NSLog(@"The Group Id :%d",getpgrp());
}
- (void)printPriority {
    
}
#pragma mark- PrivateMethod

@end
