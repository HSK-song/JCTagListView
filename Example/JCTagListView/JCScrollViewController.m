//
//  JCScrollViewController.m
//  JCTagListView_Example
//
//  Created by songzhou on 2018/4/10.
//  Copyright © 2018年 lijingcheng. All rights reserved.
//

#import "JCScrollViewController.h"
#import "JCTagListView.h"

@interface UIView (SZExt)

- (NSArray<NSLayoutConstraint *> *)sz_extentToEdgesConstraintsWithView:(UIView *)view;

@end

@implementation UIView (SZExt)

- (NSArray<NSLayoutConstraint *> *)sz_extentToEdgesConstraintsWithView:(UIView *)view {
    return @[
             [self.leftAnchor constraintEqualToAnchor:view.leftAnchor],
             [self.rightAnchor constraintEqualToAnchor:view.rightAnchor],
             [self.topAnchor constraintEqualToAnchor:view.topAnchor],
             [self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
             ];
}

@end


@interface JCScrollContentView : UIScrollView

@property (nonatomic) UIView *contentView;

@property (nonatomic) JCTagListView *tagListView;

@end

@implementation JCScrollContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _contentView = [UIView new];
        [self addSubview:_contentView];
        
        _tagListView = [JCTagListView new];
        [self.contentView addSubview:_tagListView];
        
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _tagListView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:[_contentView sz_extentToEdgesConstraintsWithView:self]];
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [_contentView.widthAnchor constraintEqualToAnchor:self.widthAnchor]
                                                  ]];
        
        [NSLayoutConstraint activateConstraints:[_tagListView sz_extentToEdgesConstraintsWithView:self.contentView]];

    }
    return self;
}

@end

@interface JCScrollViewController ()

@property (nonatomic) JCScrollContentView *view;

@end

@implementation JCScrollViewController

@dynamic view;
- (void)loadView {
    self.view = [JCScrollContentView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.tagListView.tags addObjectsFromArray:@[@"NSString", @"NSMutableString", @"NSArray", @"UIAlertView", @"UITapGestureRecognizer", @"IBOutlet", @"IBAction", @"id", @"UIView", @"UIStatusBar", @"UITableViewController", @"UIStepper", @"UISegmentedControl", @"UICollectionViewController", @"UISearchBar", @"UIToolbar", @"UIPageControl", @"UIActionSheet", @"NSMutableArray", @"NSDictionary", @"NSMutableDictionary", @"NSSet", @"NSMutableSet", @"NSData", @"NSMutableData", @"NSDate", @"NSCalendar", @"UIButton", @"UILabel", @"UITextField", @"UITextView", @"UIImageView", @"UITableView", @"UICollectionView", @"UIViewController"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
