//
//  AgreementView.h
//
//  AggieTracks
//  Created by Harsha Chenji on 4/10/11.
//  Copyright 2011 Texas A&M. All rights reserved.  
//
//  AggieTracks is forked from CycleTracks: http://github.com/sfcta/CycleTracks. 
//  CycleTracks is Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 8/10/09
//  For more information on the CycleTracks project,
//  e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>

#import <UIKit/UIKit.h>
#import "User.h"

@protocol ModalViewControllerDelegate <NSObject>

- (void)didDismissModalViewWithProceed;
- (void)didDismissModalViewWithQuit;

@end

@interface AgreementView : UIViewController <ModalViewControllerDelegate>{
	
	UITextView *tview;
    UIWebView *webview;
    NSManagedObjectContext *managedObjectContext;
    User *user;
}


@property (nonatomic,retain) IBOutlet UITextView *tview;
@property (nonatomic,retain) IBOutlet UIWebView *webview;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
