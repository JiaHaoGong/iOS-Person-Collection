

iOS开发时,为什么有的文件在h文件头导入,有的在m文件头导入?


为什么都要在.h导入？你用到的一些私有的方法，私有的类，完全可以在.m文件导入的.h 文件只是一个公开的接口文件。不建议在h导入，建议都在m文件导入其它头文件。在.h中引入会影响编译预处理的速度。因为包含其它头文件的.h文件又有可能被别的地方引用。


// 多线程、block
- (void)downloadFileWithURL:(NSURL *)url completion:(void (^)(UIImage *image))completion
{
    // GCD中的串行队列异步方法
    dispatch_queue_t q = dispatch_queue_create("cn.itcast.download", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(q, ^{
        NSLog(@"%@", [NSThread currentThread]);
        // 回到主现成
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(self.cacheImage);
        });
    });
}


// 初始化
- (id)init
{
    if (nil != (self = [super init]))
    {
        NSLog (@"init: text %@ / results %@", _textField, _resultsField);
    }
    
    return self;
}

- (void)awakeFromNib
{
    NSLog (@"awake: text %@ / results %@", _textField, _resultsField);
    
    [_textField setStringValue:@"Enter text here"];
    [_resultsField setStringValue:@"Results"];
}

// 协议
#import <UIKit/UIKit.h>
@class TDTabBar;

@protocol XNTabBarDelegate <NSObject>
/**
 *  工具栏按钮被选中, 记录从哪里跳转到哪里. (方便以后做相应特效)
 */
- (void) tabBar:(TDTabBar *)tabBar selectedFrom:(NSInteger) from to:(NSInteger)to;

@end

@interface TDTabBar : UIView

@property(nonatomic,weak) id<XNTabBarDelegate> delegate;
/**
 *  使用特定图片来创建按钮, 这样做的好处就是可扩展性. 拿到别的项目里面去也能换图片直接用
 *
 *  @param image         普通状态下的图片
 *  @param selectedImage 选中状态下的图片
 */
-(void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *) selectedImage;

@end

// 数据、字符串
    NSString *picString= [NSString stringWithFormat:@"%@%ld.png", picNams, (long)button.tag + 1];

if ([vc isKindOfClass:[GoodsDetailViewController class]]) {
    
}

// 各种宏定义
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)

typedef NS_ENUM(NSInteger, BALabelControlEvents) {
    BALabelControlEventTap,
    BALabelControlEventLongPressBegan,
    BALabelControlEventLongPressEnd,
};

// view相关
UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 250)];
[view1 setBounds:CGRectMake(-20, -20, 280, 250)];
view1.backgroundColor = [UIColor redColor];
[self.view addSubview:view1];//添加到self.view
NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(view1.frame),NSStringFromCGRect(view1.bounds));

