//
//  ViewController.m
//  圈选
//
//  Created by Burt on 2021/8/30.
//

#import "ViewController.h"
#import "PaintBoard.h"

@interface ViewController ()
@property(nonatomic,strong)PaintBoard *paintBoard;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    _paintBoard = [[PaintBoard alloc] init];
    _paintBoard.resaultBlock = ^(NSMutableArray * _Nonnull resault) {
        NSLog(@"\n\n\n\n\n\n\n\nResault:%@",resault);
    };
    _paintBoard.center = self.view.center;
    [self.view addSubview:_paintBoard];
    
    
}


@end
