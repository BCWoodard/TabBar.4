//
//  UITabBarController+Button.h
//  TabBar.4
//
//  Created by Brad Woodard on 12/20/12.
//  Copyright (c) 2012 Brad Woodard. All rights reserved.
//

#import <Social/Social.h>

@interface UITabBarController (Button) <UIActionSheetDelegate>

- (void)replaceItemAtIndex:(NSUInteger)index withButtonImage:(UIImage*)buttonImage;

@end
