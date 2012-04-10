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
//  CustomPickerDataSource.h
//  CycleTracks
//
//  Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/22/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>


// Trip Purpose descriptions
#define kDescCommute	@"The primary reason for this trip is going to or from  a  class for which you are registered at either Texas A&M or Blinn."


#define kDescSchool		@"The primary reason for this trip is going to or from the location where you are living here in Bryan-College Station (on-campus dorm room, apartment, house, etc)."

#define kDescWork		@"The primary reason for this trip is going to or from the location where you are employed, if you are employed."

#define kDescExercise	@"The primary reason for this trip is going to or from a non-class school related activity such as to the library, attending a study group, meeting with an advisor or prof."

#define kDescSocial		@"The primary reason for this trip purpose going to or from a social activity such as going to The Chicken, a restaurant, the movies or a friendís house."

#define kDescShopping	@"The primary reason for this trip is go to a retail store to buy something (e.g. food, soda, clothes, books, etc)."

#define kDescErrand		@"The primary reason for this trip can be anything where a service is sought such as to a bank or to a Doctor's appointment."

#define kDescOther		@"The primary reason for this trip is anything not related to any of the above categories.  When in doubt, specify it below and tell us the reason for the trip."



@interface CustomPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
	NSArray	*customPickerArray; 
    NSArray *modePickerArray;
	id<UIPickerViewDelegate> parent;
}

@property (nonatomic, retain) NSArray *customPickerArray;
@property (nonatomic, retain) NSArray *modePickerArray;

@property (nonatomic, retain) id<UIPickerViewDelegate> parent;

@end
