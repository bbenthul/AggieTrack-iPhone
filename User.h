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
//  User.h
//  CycleTracks
//
//  Copyright 2009-2010 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/25/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth@sfcta.org>

#import <CoreData/CoreData.h>

@class Trip;

@interface User :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSNumber * cyclingFreq;
@property (nonatomic, retain) NSString * schoolZIP;
@property (nonatomic, retain) NSString * workZIP;
@property (nonatomic, retain) NSString * homeZIP;
@property (nonatomic, retain) NSString * ownacar;
@property (nonatomic, retain) NSString * enterdrawing;
@property (nonatomic, retain) NSString * liveoncampus;
@property (nonatomic, retain) NSString * classification;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * hasaccepted;
@property (nonatomic, retain) NSString * hasenteredvalidinfo;
@property (nonatomic, retain) NSNumber * lastendlat;
@property (nonatomic, retain) NSNumber * lastendlong;

@property (nonatomic, retain) NSSet* trips;



@end


@interface User (CoreDataGeneratedAccessors)
- (void)addTripsObject:(Trip *)value;
- (void)removeTripsObject:(Trip *)value;
- (void)addTrips:(NSSet *)value;
- (void)removeTrips:(NSSet *)value;

@end

