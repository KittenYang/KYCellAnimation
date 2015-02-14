//
//  TableViewController.m
//  KYCellAnimation
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableSet *showIndexes;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showIndexes = [NSMutableSet set];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KYCell" forIndexPath:indexPath];
    
    return cell;
}




#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //动画1：
    if (![self.showIndexes containsObject:indexPath]) {
        [self.showIndexes addObject:indexPath];
        CGFloat rotationAngleDegrees = -30;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/ 180);
        CGPoint offsetPositioning = CGPointMake(-80, -80);
        
        
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, 0.0,  0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y , 0.0);
        
        cell.layer.transform = transform;
        cell.alpha = 0.7;
        [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.layer.opacity = 1;
        } completion:nil];
    }
    
    
    
    
    /*
    //动画2：
    if (![self.showIndexes containsObject:indexPath]) {
        [self.showIndexes addObject:indexPath];
        
        CATransform3D rotation;
        rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
        rotation.m34 = 1.0/ -600;
        
        
        //2. Define the initial state (Before the animation)
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        cell.layer.anchorPoint = CGPointMake(0, 0.5);
        
        
        //3. Define the final state (After the animation) and commit the animation
        [UIView beginAnimations:@"rotation" context:NULL];
        [UIView setAnimationDuration:0.3];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }
     
     */
    
    /*
     //动画3：
    if (![self.showIndexes containsObject:indexPath]) {
        [self.showIndexes addObject:indexPath];

        cell.layer.transform = CATransform3DTranslate(cell.layer.transform, 300, 0, 0);
        cell.alpha = 0.5;
        [UIView animateWithDuration:0.3 delay:0.0f usingSpringWithDamping:0.8f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
        } completion:nil];
    }
     */
}


@end
