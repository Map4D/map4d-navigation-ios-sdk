//
//  MFNavigationViewControllerDelegate.h
//  Map4dNavigation
//
//  Created by Huy Dang on 17/11/2022.
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
