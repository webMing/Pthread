//
//  ViewController.m
//  Pthread
//
//  Created by Stephanie on 2018/8/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//


/*
    为什么不创建一个Command-Line 应用？
    当初考虑到可能进行图形界面的Pthread测试,如果只是Pthread学习,可以创建Command-Line 免去每次运行真机或者模拟器的麻烦
 */


#import "ViewController.h"

#import <unistd.h>

#import "Proress.h"

@interface ViewController ()
/** proInof */
@property (strong, nonatomic) Proress *proInof;
@property (weak, nonatomic) IBOutlet UIImageView *locationImgView;
@end

@implementation ViewController

#pragma mark- LifeCicle

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setUpProess];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setUpFockExaple];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- SetUpView

- (void)initImg {
 // NSString* imgName = NSLocalizedString(@"steimg", nil);
 // UIImage *img = [UIImage imageNamed:imgName];
 // self.locationImgView.image = img;
}

- (void)setUpProess {
    [self.proInof printPID];
    [self.proInof printPPID];
    [self.proInof printGID];
}

- (void)setUpFockExaple {
    //[self.proInof forkExaple1];
    //[self.proInof forkExaple2];
    //[self.proInof forkExaple3];
    [self.proInof forkExaple4];
}

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (Proress *)proInof {
    if (!_proInof) {
        _proInof = [Proress new];
    }
    return _proInof;
}

#pragma mark- PrivateMethod




@end
