//
//  MFNavigationViewControllerDelegate.h
//  Map4dNavigation SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFNavigationViewControllerDelegate_h
#define MFNavigationViewControllerDelegate_h

#import <CoreLocation/CoreLocation.h>

@class MFNavigationViewController;

@protocol MFNavigationViewControllerDelegate <NSObject>

@optional

- (void)navigationViewController:(MFNavigationViewController *)navigationViewController dismissByCanceling:(BOOL)canceled;

- (void)didFinishNavigationViewController:(MFNavigationViewController *)navigationViewController;

@end

#endif /* MFNavigationViewControllerDelegate_h */
