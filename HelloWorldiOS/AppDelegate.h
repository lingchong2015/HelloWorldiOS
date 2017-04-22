//
//  AppDelegate.h
//  HelloWorldiOS
//
//  Created by 凌冲 on 17/4/22.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString * getDocPath();

// AppDelegate叫做应用程序委托对象（app delegate），是每个app的起点，在模式上可以看作是控制器。
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

// UIWindow对象是设备屏幕中的视图容器，UIWindow负责容纳视图与向视图分发事件，一般情况下（除非将app显示在外部设备屏幕中）一个app只有一个UIWindow对象。
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *tvTask;
@property (nonatomic) UITextField *tfTask;
@property (nonatomic) UIButton *btnInsert;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end

