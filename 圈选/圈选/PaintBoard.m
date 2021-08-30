//
//  PaintBoard.m
//  圈选
//
//  Created by Burt on 2021/8/30.
//

#import "PaintBoard.h"

@interface PaintBoard ()
@property(nonatomic,strong)NSMutableArray *views;
@property(nonatomic,strong)UIBezierPath *path;
@end

@implementation PaintBoard

-(instancetype)init{
    if (self = [super init]) {
        _views = [NSMutableArray new];
        
        self.backgroundColor = UIColor.greenColor;
        self.frame = CGRectMake(0, 0, 300, 300);
        
        for (int i = 0; i < 10; i ++) {//i行
            for (int j = 0; j < 10; j ++) {//j列
                UILabel *view = [UILabel new];
                view.frame = CGRectMake(j * 30, i * 30, 30, 30);
                view.text = [NSString stringWithFormat:@"%d",i * 10 + j];
                view.tag = i * 10 + j;
                [self addSubview:view];
                [_views addObject:view];
            }
        }
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint startPoint = [touch locationInView:self];
    NSLog(@"begin:%.0f~%.0f",startPoint.x,startPoint.y);
    
    UIGraphicsBeginImageContext(self.bounds.size);
    _path = [UIBezierPath bezierPath];
    _path.lineWidth = 5;
    [_path moveToPoint:startPoint];
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint movePoint = [touch locationInView:self];
    NSLog(@"move:%.0f---%.0f",movePoint.x,movePoint.y);
    
    [_path addLineToPoint:movePoint];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint endPoint = [touch locationInView:self];
    NSLog(@"end:%.0f---%.0f",endPoint.x,endPoint.y);
    [_path addLineToPoint:endPoint];
    [self setNeedsDisplay];
    
    NSMutableArray *resaults = [NSMutableArray new];
    for (UIView *view in _views) {
        if ([_path containsPoint:view.center]) {
            [resaults addObject:[NSString stringWithFormat:@"%ld",view.tag]];
        }
    }
    if (self.resaultBlock) {
        self.resaultBlock(resaults);
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches{
    
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    [[UIColor redColor] setStroke];
    [_path stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
