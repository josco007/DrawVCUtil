//
//  DrawVC.h
//  iosEntAlmCte
//
//  Created by Noe Miranda on 4/24/14.
//  Copyright (c) 2014 Interceramic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrawVCDelegate <NSObject>
-(void)drawVC:(UIViewController*)pDrawVC imagen:(UIImage*)imagen;
-(void)drawVC:(UIViewController*)pDrawVC viewDidAppearFinished:(NSObject*) pData;
@end

enum ButtonsModes{
    DefaultButtonsMode,
    ThreeButtonsAndABox
};


@interface DrawVC : UIViewController<UIAlertViewDelegate>{
    
#pragma mark - variables
    //GCPoints
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    CGPoint currentPoint;
    //UIAlertsView
    UIAlertView *confirmarLimpiar;
    UIAlertView *confirmarGuardar;
    
    BOOL blockedMessage;
    NSString * blockedMessageStr;
    
    enum ButtonsModes buttonsMode;


    
#pragma mark - IBOutlets
    //UIMageViews
    IBOutlet UIImageView *imageView;
    //UIButtons
    IBOutlet UIButton *limpiarBtn;
    IBOutlet UIButton *guardarBtn;
    //UILabels
    IBOutlet UILabel *tituloFirmaLbl;
    //UIViews
    IBOutlet UIView *tmeBetweenCleanAndSaveView;
    IBOutlet UIView *blockViewMessage;
    IBOutlet UILabel *blockViewMessageLbl;
    __weak IBOutlet UIView *buttonsTme;
    IBOutlet UIView *threeButtonsAndABoxView;
    IBOutlet UIView *defaultButtonsModeView;
    

    
}
@property (nonatomic) BOOL isPresented;
@property (nonatomic) BOOL blockedMessage;
@property (nonatomic) NSString *blockedMessageStr;
@property (nonatomic) BOOL showSaveAlert;
@property (nonatomic, unsafe_unretained) id <DrawVCDelegate> delegate;
@property (nonatomic)  NSString *titleLbl;
@property (strong, nonatomic) IBOutlet UIView *tmeBetweenCleanAndSaveView;

-(void) blockDrawWithMessage:(NSString*)pMessage;
-(void) removeBlockViewMessage;
- (void) setButtonsMode:(enum ButtonsModes) pMode;




@end
