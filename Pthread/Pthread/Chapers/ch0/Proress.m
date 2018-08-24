//
//  Proress.m
//  Pthread
//
//  Created by Stephanie on 2018/8/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "Proress.h"

#import <unistd.h>

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sched.h>

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

#pragma mark- PrivateMethod

//多进程创建
- (void)forkExaple1 {
    
    printf("Create proccess begin! \n ");
    printf("Proceess ID is %d \n ",getpid());
    
    pid_t pid = fork();
    if (pid == 0) {
        printf("I am child proccess! \n");
        printf("My proceess ID is %d ; My parent proceess ID is %d \n",getpid(),getppid());
    }
    else if (pid > 0) {
        printf("I am parent proccess! \n");
        printf("My proceess ID is %d ; My parent proceess ID is %d \n",getpid(),getppid());
    }
    else {
        printf("Create proccess failt ! \n ");
    }
    
    printf("Create proccess end ! \n \n ");
    
    // 关于fork函数解析链接地址: https://www.cnblogs.com/yuanshuang/p/5571127.html
}

//多进程间资源拷贝
- (void)forkExaple2 {
    
    printf("Create proccess begin! \n ");
    printf("Proceess ID is %d \n ",getpid());
    
    int cnt = 0;
    pid_t pid = fork();
    
    if (pid == 0) {
        printf("I am child proccess! My proceess ID is %d \n",getpid());
        cnt++;
        printf("Ctn Value:%d \n",cnt);
    }
    else if (pid > 0) {
        printf("I am parent proccess! My proceess ID is %d  \n",getpid());
        cnt++;
        printf("Ctn Value:%d \n",cnt);
    }
    else {
        printf("Create proccess failt ! \n ");
    }
    
    printf("Create proccess end !  ");
    
    // 关于fork vfork 区别 链接地址: https://blog.csdn.net/jianchi88/article/details/6985326
}

//多进程间资源拷贝
- (void)forkExaple3 {
    
    printf("Create proccess begin! \n ");
    printf("Proceess ID is %d \n ",getpid());
    int cnt = 0;
    pid_t pid = vfork();
    
    if (pid == 0) {
        printf("I am child proccess! My proceess ID is %d \n",getpid());
        cnt++;
        printf("Ctn Value:%d \n",cnt);
        exit(0);
    }
    else if (pid > 0) {
        printf("I am parent proccess! My proceess ID is %d  \n",getpid());
        cnt++;
        printf("Ctn Value:%d \n",cnt);
    }
    else {
        printf("Create proccess failt ! \n ");
    }
    
    printf("Create proccess end ! ");
    
     // 关于fork vfork 区别 链接地址: https://blog.csdn.net/jianchi88/article/details/6985326
}

// vfork 创建的子进程必须先执行完,然后父进程才开始执行它的逻辑代码
- (void)forkExaple4 {
   
    pid_t pid ;
    if (!(pid = vfork())) {
        // sub proccess excute!
        printf("I am sub procces, my pid is :%d \n ",getpid());
        int cnt = 0;
        while (1) {
            cnt++;
            printf("Cnt value:%d \n",cnt);
            if (cnt > 20) {
                exit(0); //子进程一直执行直到 调用 exit(0) 退出;
            }
        }
    }
    // parent proccess excute!
    printf("I am arent procces, my pid is :%d",getpid());
}

// clone 创建子线程

int FIBER_STACK = 8192;
int a = 2;
void *stack;

void doSomeThing() {
    a = 10;
    printf("I am sub procces, my pid is :%d \n ",getpid());
    free(stack);
    exit(0);
}

- (void)forkExaple5 {
    a = 1;
    stack = malloc(FIBER_STACK);
    if (!stack) {
        printf("The stack failed \n");
        exit(0);
    }
     printf("Create sub proccess \n");
     //clone(&doSomeThing, (char *)stack + FIBER_STACK, CLONE_VM | CLONE_VFORK, 0);//创建子线程
     printf("Parent proccess , my pid is: %d, the a is: %d ", getpid(), a);
    
     /*
       clone和fork的区别：
      （1）clone和fork的调用方式很不相同,clone调用需要传入一个函数,该函数在子进程中执行.
      （2）clone和fork最大不同在于clone不再复制父进程的栈空间,而是自己创建一个新的;（void *child_stack）也就是第二个参数,需要分配栈指针的空间大小,所以它不再是继承或者复制,而是全新的创造.
      */
}

@end
