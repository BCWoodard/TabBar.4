//
//  UITabBarController+Button.m
//  TabBar.4
//
//  Created by Brad Woodard on 12/20/12.
//  Copyright (c) 2012 Brad Woodard. All rights reserved.
//

#import "UITabBarController+Button.h"

#define kBUTTON_TAG   4096

@implementation UITabBarController (Button)

- (void)replaceItemAtIndex:(NSUInteger)index withButtonImage:(UIImage*)buttonImage {
    
    UIButton *button = (UIButton *)[self.view viewWithTag:2];
    
    if (!button) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 2;
        [button setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        UITabBar *bar = self.tabBar;
        CGFloat width = bar.frame.size.width / bar.items.count;
        button.frame = CGRectMake(index*width, bar.frame.origin.y, width, bar.frame.size.height);
        
        [self.view addSubview:button];
    }
}

#pragma mark - Handle button tap

/*
- (void)buttonTapped:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Action Sheet:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Action A", @"Action B", @"Action C", nil];
    
    [sheet showFromTabBar:self.tabBar];
}
*/

// SHOW the actionSheet
- (void)buttonTapped:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share Your Visit with Friends!" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter", @"Email eduLaunchpad", nil];
    [actionSheet showFromTabBar:self.tabBar];
}

// ACTIONSHEET BUTTONS
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        SLComposeViewController *facebookView;
        facebookView = [[SLComposeViewController alloc] init];
        facebookView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        // Set the initial text and image
        [facebookView setInitialText:@"I'm using the eduLaunchpad Campus Tour App!"];
        [facebookView addImage:[UIImage imageNamed:@""]];
        
        [self presentViewController:facebookView animated:YES completion:NULL];
    }
    
    else if (buttonIndex == 1)
    {
        // Create the view
        SLComposeViewController *tweetView;
        // Allocate and initialize
        tweetView = [[SLComposeViewController alloc] init];
        // Identify the social service
        tweetView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        // Set the initial text and image
        [tweetView setInitialText:@"I'm using the eduLaunchpad Campus Tour App!"];
        [tweetView addImage:[UIImage imageNamed:@""]];
        
        // Present the viewer
        [self presentViewController:tweetView animated:YES completion:NULL];
    }
    
    else
    {
        NSLog(@"Send email to eduLP");
    }
}
@end
