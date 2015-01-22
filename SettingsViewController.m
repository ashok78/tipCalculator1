//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Ashok Kumar on 1/21/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefaultControl;
- (void) loadTipPercentage;
- (IBAction)changeDefaultTipPercentage:(id)sender;
- (void) setBackgroundColor: (int) index;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadTipPercentage];
}

- (void) loadTipPercentage{
    // Load default value from stored defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = [defaults integerForKey:@"defaultTipIndex"];
    
    [self.tipDefaultControl setSelectedSegmentIndex:tipIndex];
    [self setBackgroundColor:tipIndex];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Store new default tip percentage index.

- (IBAction)changeDefaultTipPercentage:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    int index = self.tipDefaultControl.selectedSegmentIndex;
    NSLog(@"%d", index);
    
    [defaults setInteger:index forKey:@"defaultTipIndex"];
    
    [defaults synchronize];
    [self setBackgroundColor:index];

    
}

- (void)setBackgroundColor: (int)index{
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:0.6 alpha:1];
    
    switch (index) {
        case 0:
            color = [UIColor colorWithRed:0 green:0 blue:0.3 alpha:1];;
            break;
            
        case 1:
            color = [UIColor colorWithRed:0 green:0 blue:0.45 alpha:1];;
            break;
        default:
            break;
    }
    self.view.backgroundColor = color;
}

@end
