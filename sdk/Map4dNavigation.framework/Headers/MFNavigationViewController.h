//
//  MFNavigationViewController.h
//  Map4dNavigation
//
//  Created by Huy Dang on 21/07/2022.
//

#ifndef MFNavigationViewController_h
#define MFNavigationViewController_h

#import <UIKit/UIKit.h>
#import <Map4dServices/Map4dServices.h>
#import "MFNavigationOptions.h"
#import "MFNavigationViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MFNavigationViewController : UIViewController

@property(nonatomic, weak, nullable) id<MFNavigationViewControllerDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;


- (instancetype)initWithDirectionsResult:(MFDirectionsResult *)directionsResult
                              routeIndex:(NSUInteger)routeIndex
                        directionsParams:(MFDirectionsParams *)directionsParams;

- (instancetype)initWithDirectionsResult:(MFDirectionsResult *)directionsResult
                              routeIndex:(NSUInteger)routeIndex
                        directionsParams:(MFDirectionsParams *)directionsParams
                       navigationOptions:(MFNavigationOptions *)navigationOptions;

@end

NS_ASSUME_NONNULL_END

#endif /* MFNavigationViewController_h */
