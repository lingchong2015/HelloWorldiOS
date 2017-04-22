//
//  AppDelegate.m
//  HelloWorldiOS
//
//  Created by 凌冲 on 17/4/22.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

NSString * getDocPath() {
    NSArray *docPathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", docPathList[0]);
    return [docPathList[0] stringByAppendingPathComponent:@"data.plist"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Actions

- (void)addTask:(id)sender {
    NSString *text = [self.tfTask text];
    if ([text length] == 0) {
        return;
    }
    
    NSLog(@"Task entered: %@", text);
    
    [self.tasks addObject:text];
    [self.tvTask reloadData];
    
    [self.tfTask setText:@""];
    [self.tfTask resignFirstResponder];
}

#pragma mark - UITableViewDataSource回调方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tvTask dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *string = [self.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
    return cell;
}

#pragma mark - AppDelegate回调方法

/*
 * 完成应用程序与用户交互前的初始化工作。
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建与初始化数据模型。
    NSArray *plist = [NSArray arrayWithContentsOfFile:getDocPath()];
    if (plist != nil) {
        self.tasks = [plist mutableCopy];
    } else {
        self.tasks = [NSMutableArray array];
    }
    
    // 创建并设置UIWindow对象。
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    self.window.rootViewController = [[UIViewController alloc] init];
    
    // 设置三个UI对象的frame属性。
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect btnFrame = CGRectMake(228, 40, 72, 31);
    
    // 创建并设置UITableView对象。
    self.tvTask = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tvTask.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tvTask registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tvTask setDataSource:self];
    
    // 创建并设置UITextField对象。
    self.tfTask = [[UITextField alloc] initWithFrame:fieldFrame];
    self.tfTask.borderStyle = UITextBorderStyleRoundedRect;
    self.tfTask.placeholder = @"Type a task, tap Insert";
    [self.tfTask becomeFirstResponder];
    
    // 创建并设置UIButton对象。
    self.btnInsert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnInsert.frame = btnFrame;
    [self.btnInsert setTitle:@"Insert" forState:UIControlStateNormal];
    [self.btnInsert addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // 将三个UI对象添加到UIWindow对象中。
    [self.window.rootViewController.view addSubview:self.tvTask];
    [self.window.rootViewController.view addSubview:self.tfTask];
    [self.window.rootViewController.view addSubview:self.btnInsert];
    // [self.window bringSubviewToFront:self.btnInsert];
    
    // 设置UIWindow对象的背景色，并在屏幕上显示。
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self.tasks writeToFile:getDocPath() atomically:true];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
