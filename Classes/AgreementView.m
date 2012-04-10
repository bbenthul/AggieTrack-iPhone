//
//  AgreementView.m
//  CycleTracks
//
//  Created by Harsha Chenji on 4/10/11.
//  Copyright 2011 Texas A&M. All rights reserved.
//

#import "AgreementView.h"
#import "PopupAgreementView.h"
#import "PersonalInfoViewController.h"

@implementation AgreementView

@synthesize tview, managedObjectContext, user, webview;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (User *)createUser
{
	// Create and configure a new instance of the User entity
	User *noob = (User *)[[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:managedObjectContext] retain];
	
	NSError *error;
	if (![managedObjectContext save:&error]) {
		// Handle the error.
		NSLog(@"createUser error %@, %@", error, [error localizedDescription]);
	}
	[noob setHasaccepted:@"No"];
    [noob setHasenteredvalidinfo:@"No"];
    [noob setLastendlat:[[NSNumber alloc] initWithDouble:0.0]];
    [noob setLastendlong:[[NSNumber alloc] initWithDouble:0.0]];
    
    
    
	return noob;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
    
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(5, 70, 310, 300)];
    webview.autoresizesSubviews = YES;
    [webview setBackgroundColor:[UIColor clearColor]];  
    [webview setOpaque:NO];
    [[self view] addSubview:webview];
    
    
    NSFetchRequest		*request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];

    NSError *error;
	NSInteger count = [managedObjectContext countForFetchRequest:request error:&error];
	NSLog(@"saved user count  = %d", count);
	if ( count == 0 )
	{
		// create an empty User entity
		[self setUser:[self createUser]];
	}
	
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle the error.
		NSLog(@"no saved user");
		if ( error != nil )
			NSLog(@"PersonalInfo viewDidLoad fetch error %@, %@", error, [error localizedDescription]);
	}
	
	[self setUser:[mutableFetchResults objectAtIndex:0]];
	if ( user != nil )
	{
        if ([user.hasaccepted isEqualToString:@"No"]) {
            
            PopupAgreementView *aview = [[PopupAgreementView alloc] initWithNibName:@"PopupAgreementView" bundle:nil];
            
            aview.delegate = self;
            
            [self presentModalViewController:aview animated:YES];
            [aview release];            
            
        } else {
            NSError *err = nil;
            NSString* filePath = [[NSBundle mainBundle] pathForResource:@"agreement" 
                                                                 ofType:@"rtf"];
//            tview.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&err];
            tview.text = @"You've accepted the agreement. Information:\n--------------------------------------------";
            
            NSURL *url = [[NSURL alloc] initWithString:@"http://www.aggietrack.com"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webview loadRequest:req];
            
        }
        
        if ([user.hasenteredvalidinfo isEqualToString:@"No"]) {
            [self.tabBarController.tabBar setUserInteractionEnabled:FALSE];
            self.tabBarController.selectedIndex = 3;
        } else {
            [self.tabBarController.tabBar setUserInteractionEnabled:YES];
//            self.tabBarController.selectedIndex = 3;
        }
	}
	else
		NSLog(@"init FAIL");
	
	[mutableFetchResults release];
	[request release];

    

    
    

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {


    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {

    [super dealloc];
}

- (void)didDismissModalViewWithProceed {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    
    NSError *err = nil;
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"agreement" 
                                                    ofType:@"rtf"];
//    tview.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&err];
    
//    tview.text = @"You've accepted the agreement!";
    tview.text = @"You've accepted the agreement. Information:\n--------------------------------------------";
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.aggietrack.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webview loadRequest:req];
    
    [user setHasaccepted:@"Yes"];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        // Handle the error.
        NSLog(@"PersonalInfo save cycling freq error %@, %@", error, [error localizedDescription]);
    }
    
//    PersonalInfoViewController *aview = [[PersonalInfoViewController alloc] initWithNibName:@"PersonalInfo" bundle:nil];
//    
//    aview.modaldelegate = self;
//    
//    [self presentModalViewController:aview animated:YES];
//    [aview release];
    
  	self.tabBarController.selectedIndex = 3;
    
    [self.tabBarController.tabBar setUserInteractionEnabled:FALSE];
    
}




- (void)didDismissModalViewWithQuit {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    tview.text = @"You've not accepted the agreement.";
    [user setHasaccepted:@"No"];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        // Handle the error.
        NSLog(@"PersonalInfo save cycling freq error %@, %@", error, [error localizedDescription]);
    }
    exit(0);
    
}

@end
