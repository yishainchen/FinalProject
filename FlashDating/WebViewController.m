//
//  WebViewController.m
//  FlashDating
//
//  Created by yishain on 7/4/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIActivityIndicatorView *indicatorView;
}
@property UIRefreshControl *refershControl;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    // Do any additional setup after loading the view.
    self.refershControl = [[UIRefreshControl alloc] init];
    [self.refershControl addTarget:self action:@selector(loadRequest:) forControlEvents:UIControlEventValueChanged];
    NSURL *url = [NSURL URLWithString:@"https://www.alphacamp.co/seminars/swift-intro/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
     [_refershControl endRefreshing];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [indicatorView stopAnimating];
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
