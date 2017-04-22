//
//  main.m
//  HelloWorldiOS
//
//  Created by 凌冲 on 17/4/22.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // UIApplicationMain函数在main（应用程序入口点）函数中被调用，用以创建UIApplication对象与UIApplication的委托对象，以及建立消息事件循环。
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
