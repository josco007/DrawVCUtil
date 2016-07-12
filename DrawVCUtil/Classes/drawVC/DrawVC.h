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

@interface DrawVC : UIViewController<UIAlertViewDelegate>{
    
#pragma mark - variables
    //GCPoints
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    CGPoint currentPoint;
    //UIAlertsView
    UIAlertView *confirmarLimpiar;
    UIAlertView *confirmarGuardar;

    
    

    
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

    
}
@property (nonatomic) BOOL isPresented;
@property (nonatomic) BOOL showSaveAlert;
@property (nonatomic, unsafe_unretained) id <DrawVCDelegate> delegate;
@property (nonatomic)  NSString *titleLbl;
@property (strong, nonatomic) IBOutlet UIView *tmeBetweenCleanAndSaveView;

@end
