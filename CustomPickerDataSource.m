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
//  CustomPickerDataSource.m
//  CycleTracks
//
//  Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/22/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>

#import "CustomPickerDataSource.h"
#import "CustomView.h"
#import "TripPurposeDelegate.h"

@implementation CustomPickerDataSource

@synthesize customPickerArray, parent, modePickerArray;

- (id)init
{
	// use predetermined frame size
	self = [super init];
	if (self)
	{
		// create the data source for this custom picker
		NSMutableArray *viewArray = [[NSMutableArray alloc] init];

		/*
		 * Class
		 * Home/Dorm
		 * Work
		 * School-related
		 * Social/Rec.
		 * Shopping
		 * Errand
		 * Other
		 */
		
		CustomView *view;
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Class";
//		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Home/Dorm";
//		view.image = [UIImage imageNamed:kTripPurposeSchoolIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Work";
//		view.image = [UIImage imageNamed:kTripPurposeWorkIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"School-related";
//		view.image = [UIImage imageNamed:kTripPurposeExerciseIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Social/Rec.";
//		view.image = [UIImage imageNamed:kTripPurposeSocialIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Shopping";
//		view.image = [UIImage imageNamed:kTripPurposeShoppingIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Errand";
//		view.image = [UIImage imageNamed:kTripPurposeErrandIcon];
		[viewArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Other";
//		view.image = [UIImage imageNamed:kTripPurposeOtherIcon];
		[viewArray addObject:view];
		[view release];

		self.customPickerArray = viewArray;


        [viewArray release];

        
        /*
		 * Walk
		 * Bike
		 * Motorbike
		 * Carpool
		 * Bus
		 * Car
		 * Other
		 */
        
        NSMutableArray *modesArray = [[NSMutableArray alloc] init];
        
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Walk";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
		
		view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Bike";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];    
        
        view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Motorbike";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
        
        view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Carpool";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
        
        view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Bus";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
        
        
        view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Car";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
        
        view = [[CustomView alloc] initWithFrame:CGRectZero];
		view.title = @"Other";
        //		view.image = [UIImage imageNamed:kTripPurposeCommuteIcon];
		[modesArray addObject:view];
		[view release];
        
		self.modePickerArray = modesArray;
        
        
        [modesArray release];
	}
	return self;
}

- (void)dealloc
{
    [modePickerArray release];
	[customPickerArray release];
	[super dealloc];
}


#pragma mark UIPickerViewDataSource


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return [CustomView viewWidth];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return [CustomView viewHeight];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [customPickerArray count];
    else 
        return [modePickerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}


#pragma mark UIPickerViewDelegate


// tell the picker which view to use for a given component and row, we have an array of views to show
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == 0)
        return [customPickerArray objectAtIndex:row];
    else
        return [modePickerArray objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	//NSLog(@"child didSelectRow: %d inComponent:%d", row, component);
	[parent pickerView:pickerView didSelectRow:row inComponent:component];
}



@end
