//
//  DVViewController.m
//  DrawVCUtil
//
//  Created by josco007 on 07/12/2016.
//  Copyright (c) 2016 josco007. All rights reserved.
//


#import "DVViewController.h"

@interface DVViewController ()

@end

@implementation DVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self navigationController] setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
}
- (IBAction)showDrawVC:(id)sender {
    drawVC = [[DrawVC alloc] initWithNibName:@"DrawVC" bundle:[NSBundle bundleForClass:[DrawVC class]]];
    drawVC.delegate = self;
    [drawVC setShowSaveAlert:YES];
    //[drawVC blockDrawWithMessage:@"BlockView"];
    [self presentViewController:drawVC animated:YES completion:nil];
    //[drawVC setButtonsMode: ThreeButtonsAndABox];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)drawVC:(UIViewController *)pDrawVC imagen:(UIImage *)imagen{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:imagen];
    [self.view addSubview:imageV];
}

-(void)drawVC:(UIViewController *)pDrawVC viewDidAppearFinished:(NSObject *)pData{
    
}





@end
