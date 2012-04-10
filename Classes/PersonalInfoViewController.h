/**  CycleTracks, Copyright 2009,2010 San Francisco County Transportation Authority
 *                                    San Francisco, CA, USA
 *
 *   @author Matt Paul <mattpaul@mopimp.com>
 *
 *   This file is part of CycleTracks.
 *
 *   CycleTracks is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   CycleTracks is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with CycleTracks.  If not, see <http://www.gnu.org/licenses/>.
 */

//
//  PersonalInfoViewController.h
//  CycleTracks
//
//  Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/23/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>

#import <UIKit/UIKit.h>
#import "PersonalInfoDelegate.h"


@class User;


@interface PersonalInfoViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
	id <PersonalInfoDelegate> delegate;
//    id <ModalViewControllerDelegate> modaldelegate;
    
	NSManagedObjectContext *managedObjectContext;
	User *user;

	UITextField *age;
	UITextField *email;
	UITextField *gender;
	UITextField *homeZIP;
	UITextField *workZIP;
	UITextField *schoolZIP;
    
    UISegmentedControl *entersurveyswitch;
    UISegmentedControl *owncarswitch;
    UISegmentedControl *liveoncampusswitch;
    UITextField *classification;
    UITextField *name;
    
    UIPickerView *countryPicker;
    
	NSNumber	*cyclingFreq;
    NSMutableArray* arrayNo;
}


@property (nonatomic, retain) id <PersonalInfoDelegate> delegate;
//@property (nonatomic, retain) id <ModalViewControllerDelegate> modaldelegate;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) User *user;

@property (nonatomic, retain) UITextField	*age;
@property (nonatomic, retain) UITextField	*email;
@property (nonatomic, retain) UITextField	*gender;
@property (nonatomic, retain) UITextField	*homeZIP;
@property (nonatomic, retain) UITextField	*workZIP;
@property (nonatomic, retain) UITextField	*schoolZIP;
@property (nonatomic, retain) UITextField	*classification;
@property (nonatomic, retain) UITextField	*name;

@property (nonatomic, retain) UISegmentedControl	*entersurveyswitch;
@property (nonatomic, retain) UISegmentedControl	*owncarswitch;
@property (nonatomic, retain) UISegmentedControl	*liveoncampusswitch;

@property (nonatomic, retain) NSNumber		*cyclingFreq;

//- (void)initTripManager:(TripManager*)manager;

// DEPRECATED
- (id)initWithManagedObjectContext:(NSManagedObjectContext*)context;

- (void)done;


@end
