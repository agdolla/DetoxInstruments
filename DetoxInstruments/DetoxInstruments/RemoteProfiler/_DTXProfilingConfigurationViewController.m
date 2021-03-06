//
//  _DTXProfilingConfigurationViewController.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 04/08/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "_DTXProfilingConfigurationViewController.h"
#import "DTXProfilingConfiguration+RemoteProfilingSupport.h"

@interface _DTXProfilingConfigurationIntervalToTag : NSValueTransformer @end

@implementation _DTXProfilingConfigurationIntervalToTag

- (nullable id)transformedValue:(nullable id)value
{
	double val = [value doubleValue];
	
	if(val > 2.0)
	{
		return @200;
	}
	
	if(val < 0.25)
	{
		return @25;
	}
	
	return @(val * 100.0);
}

- (nullable id)reverseTransformedValue:(nullable id)value
{
	return @([value doubleValue] / 100.0);
}

@end

@implementation _DTXProfilingConfigurationViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.wantsLayer = YES;
}

- (IBAction)_useDefaultConfigurationValueChanged:(NSButton *)sender
{
	if([[NSUserDefaults standardUserDefaults] boolForKey:@"DTXProfilingConfigurationUseDefaultConfiguration"])
	{
		[DTXProfilingConfiguration.defaultProfilingConfigurationForRemoteProfiling setAsDefaultRemoteProfilingConfiguration];
	}
}


@end
