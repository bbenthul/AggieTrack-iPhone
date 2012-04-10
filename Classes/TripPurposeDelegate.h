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
//  TripPurposeDelegate.h
//  CycleTracks
//
//  Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/22/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>


#define kTripPurposeCommute		0
#define kTripPurposeSchool		1
#define kTripPurposeWork		2
#define kTripPurposeExercise	3
#define kTripPurposeSocial		4
#define kTripPurposeShopping	5
#define kTripPurposeErrand		6
#define kTripPurposeOther		7

#define kTripPurposeCommuteIcon		@"commuter2.png"
#define kTripPurposeSchoolIcon		@"school.tif"
#define kTripPurposeWorkIcon		@"work-related.tif"
#define kTripPurposeExerciseIcon	@"exercise.tif"
#define kTripPurposeSocialIcon		@"social.tif"
#define kTripPurposeShoppingIcon	@"shopping.tif"
#define kTripPurposeErrandIcon		@"errands.tif"
#define kTripPurposeOtherIcon		@"other.tif"

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

#define kTripPurposeCommuteString	@"Class"
#define kTripPurposeSchoolString	@"Home/Dorm"
#define kTripPurposeWorkString		@"Work"
#define kTripPurposeExerciseString	@"School-related"
#define kTripPurposeSocialString	@"Social/Rec."
#define kTripPurposeShoppingString	@"Shopping"
#define kTripPurposeErrandString	@"Errand"
#define kTripPurposeOtherString		@"Other"

/*
 * Walk
 * Bike
 * MotorBike
 * Carpool
 * Bus
 * Car
 * Other
 */
#define kTripModeCommuteString	@"Walk"
#define kTripModeSchoolString	@"Bike"
#define kTripModeWorkString		@"Motorbike"
#define kTripModeExerciseString	@"Carpool"
#define kTripModeSocialString	@"Bus"
#define kTripModeShoppingString	@"Car"
#define kTripModeOtherString	@"Other"



@protocol TripPurposeDelegate <NSObject>

@required
- (NSString *)getPurposeString:(unsigned int)index;
- (NSString *)setPurpose:(unsigned int)index;
- (NSString *)getModeString:(unsigned int)index;
- (NSString *)setMode:(unsigned int)index;


@optional
- (void)didCancelPurpose;
- (void)didPickPurpose:(unsigned int)index didPickMode:(unsigned int)index1 ;

@end
