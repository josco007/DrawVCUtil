//
//  DrawVC.m
//  iosEntAlmCte
//
//  Created by Noe Miranda on 4/24/14.
//  Copyright (c) 2014 Interceramic. All rights reserved.
//
//  if you want this viewcontroller show in landscape you can put this in appDelegate:
//
//func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
//    
//    
//    //http://swiftiostutorials.com/ios-orientations-landscape-orientation-one-view-controller/
//    
//    var  drawVC:DrawVC?
//    if ((self.window!.rootViewController as? UINavigationController)?.visibleViewController is DrawVC ) {
//        
//        drawVC = (self.window!.rootViewController as? UINavigationController)?.visibleViewController as? DrawVC
//        if (drawVC!.isPresented){
//            return UIInterfaceOrientationMask.Landscape;
//        }
//        else{
//            return UIInterfaceOrientationMask.Portrait;
//        }
//    }
//    
//    return UIInterfaceOrientationMask.Portrait;
//    
//    
//}


#import "DrawVC.h"
#import <QuartzCore/QuartzCore.h>

@interface DrawVC ()

@end


@implementation DrawVC

@synthesize isPresented;
@synthesize tmeBetweenCleanAndSaveView;
@synthesize showSaveAlert;
@synthesize blockedMessage;
@synthesize blockedMessageStr;

CGPoint midPoint(CGPoint p1, CGPoint p2)
{
    
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
    
}


#pragma mark - User interaction
- (IBAction)limpiarBtnTocuhUpInside:(id)sender {
    
    confirmarLimpiar = [[UIAlertView alloc] initWithTitle:@"Aviso"
                                                  message:@"¿Seguro que quieres limpiar?"
                                                 delegate:self
                                        cancelButtonTitle:@"No"
                                        otherButtonTitles:@"Si", nil];
    [confirmarLimpiar show];
    
}
- (IBAction)guardarBtnTocuhUpInside:(id)sender {
    
    if (!showSaveAlert) {
        [self sendDrawing];
        return;
    }
    
    confirmarGuardar = [[UIAlertView alloc] initWithTitle:@"Aviso"
                                                  message:@"¿Seguro que quieres guardar?"
                                                 delegate:self
                                        cancelButtonTitle:@"No"
                                        otherButtonTitles:@"Si", nil];
    [confirmarGuardar show];
}
- (IBAction)cancelarBtnTouchUpInside:(id)sender {
    //[self.navigationController popViewControllerAnimated:NO];
    isPresented = NO;
    [self.presentingViewController dismissViewControllerAnimated: YES completion: nil];
}

#pragma mark - touches delegate
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    
    previousPoint1 = [touch previousLocationInView:imageView];
    previousPoint2 = [touch previousLocationInView:imageView];
    currentPoint = [touch locationInView:imageView];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    previousPoint2 = previousPoint1;
    previousPoint1 = [touch previousLocationInView:imageView];
    currentPoint = [touch locationInView:imageView];
    
    
    // calculate mid point
    CGPoint mid1 = midPoint(previousPoint1, previousPoint2);
    CGPoint mid2 = midPoint(currentPoint, previousPoint1);
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    
    CGContextMoveToPoint(context, mid1.x, mid1.y);
    // Use QuadCurve is the key
    CGContextAddQuadCurveToPoint(context, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 2.0);//r   g    b  alpha
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextStrokePath(context);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

-(void) sendDrawing{
    if (self.delegate != nil){
        [self.delegate drawVC:self imagen:imageView.image];
    }
    
    //[[self navigationController] popViewControllerAnimated:FALSE];
}

-(void) blockDrawWithMessage:(NSString*)pMessage{
    
    blockedMessage = true;
    blockedMessageStr = pMessage;
    
    [blockViewMessage setFrame:imageView.frame];
    [blockViewMessageLbl setText:pMessage];
    
    [self.view addSubview:blockViewMessage];
    
}

-(void) removeBlockViewMessage{
    blockedMessage = false;
    [blockViewMessage removeFromSuperview];
}

#pragma mark - alertview delegates
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == confirmarLimpiar) {
        if (buttonIndex == 1) {//SI
            UIGraphicsBeginImageContext(imageView.frame.size);
            
            CGContextClearRect(UIGraphicsGetCurrentContext(),CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height));
            
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        }
    }
    else if (alertView == confirmarGuardar){
        if (buttonIndex == 1) {//Si
            [self sendDrawing];
            isPresented = NO;
            [self.presentingViewController dismissViewControllerAnimated: YES completion: nil];
        }
    }
}

#pragma mark - View lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isPresented = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [imageView layer].borderColor = [UIColor blackColor].CGColor;
    [imageView layer].borderWidth = .5;
    //limpiarBtn.transform = CGAffineTransformMakeRotation(M_PI_2);
    //guardarBtn.transform = CGAffineTransformMakeRotation(M_PI_2);
    if (_titleLbl.length == 0) {
     _titleLbl = @"Titulo";
    }
    tituloFirmaLbl.text = _titleLbl;
    //tituloFirmaLbl.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    if (blockedMessage){
        [self blockDrawWithMessage:blockedMessageStr];
    }

    

}

-(void)viewDidAppear:(BOOL)animated{

    /*NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
     */
    if (_delegate != nil){
        [_delegate drawVC:self viewDidAppearFinished:nil];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
