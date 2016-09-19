//
//  ViewController.m
//  SDNameSpaceDemo
//
//  Created by 沙莎 on 16/9/19.
//  Copyright © 2016年 沙莎. All rights reserved.
//

#import "ViewController.h"
#import "EOCSoundPlayer.h"

@interface ViewController ()

@end


/*
 
 15条：用前缀避免命名空间冲突 
 
 不仅仅类名，所有应用程序的名称都应该加上前缀 
 
 容易忽视的地方，类的实现文件中纯C函数以及全局变量 在编译好的文件中这些名称算作为顶级符号  “top-level symbol”
 
 此文件定义completion() 函数与EOCSoundPlayer中的函数存在冲突  编译出错
 */

/*
void completion(){
    
    return;
}
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EOCSoundPlayer *player = [[EOCSoundPlayer alloc]initWithUrl:[NSURL URLWithString:@"http://music.163.com/#/song?id=424474214"]];
    
    [player playSound];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
