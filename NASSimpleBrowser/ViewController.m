//
//  ViewController.m
//  NASSimpleBrowser
//
//  Created by Naveen Srivastava on 2/17/15.
//  Copyright (c) 2015 NS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _responseString = [[NSMutableString alloc] initWithCapacity:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - NSURLConnectionDelegate

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    UIAlertView *uiAlert = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Data is here!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [uiAlert show];
    
    [_urlContent setText:_responseString];
}

-(IBAction)loadURL:(id)sender{
    [_urlField resignFirstResponder];
    NSString *simpleAddr = [_urlField text];
    
    if (simpleAddr == nil || [simpleAddr isEqualToString:@""]){
        simpleAddr = @"http://www.pitt.edu";
    }
    
    NSURL *url = [NSURL URLWithString:simpleAddr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    NSURLConnection * conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if(conn!=nil){
        [conn start];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSString *newData = [NSString stringWithUTF8String:[data bytes]];
    
    [_responseString appendString:newData];
}

@end

