//
//  ViewController.h
//  NASSimpleBrowser
//
//  Created by Naveen Srivastava on 2/17/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, weak) IBOutlet UITextField *urlField;
@property (nonatomic, weak) IBOutlet UITextView *urlContent;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, weak) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSMutableString *responseString;

-(IBAction)loadURL:(id)sender;


@end