//
//  PaintBoard.h
//  圈选
//
//  Created by Burt on 2021/8/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaintBoard : UIView
@property(nonatomic,copy)void(^resaultBlock)(NSMutableArray *resault);
@end

NS_ASSUME_NONNULL_END
