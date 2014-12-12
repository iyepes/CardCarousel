//
//  iCarouselExampleViewController.m
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "iCarouselExampleViewController.h"
#import "Colours.h"

@interface iCarouselExampleViewController () <iCarouselDataSource, iCarouselDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;

@end


@implementation iCarouselExampleViewController


- (void)dealloc
{
    self.carousel.delegate = nil;
    self.carousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    self.carousel.type = iCarouselTypeCoverFlow2;
    
    self.carousel.vertical = !self.carousel.vertical;
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 250, 200) style:UITableViewStylePlain];
    tableView.dataSource = self;
    //tableView.estimatedRowHeight = 50;
    tableView.rowHeight = 60;
    self.carouselMaxIndex = self.carouselMaxIndex + 1;
    NSLog(@"Index value : %d", self.carouselMaxIndex);
    tableView.tag = self.carouselMaxIndex;
    
    
    return tableView;
}

#pragma mark -
#pragma mark Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell"];
    
    NSLog(@"Table view value : %ld", (long)tableView.tag);
    
    int viewIndex = tableView.tag;

    NSDictionary *company = [self getTableViewValuesAtIndex:viewIndex];
    
    NSLog(@"Item value : %d", indexPath.item);
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TitleCell"];
    }
    
    cell.detailTextLabel.numberOfLines = 0;
    if (indexPath.item == 0) {
        cell.backgroundColor = [UIColor black75PercentColor];
        cell.textLabel.text = [company objectForKey:@"companyName"];
        cell.detailTextLabel.text = [company objectForKey:@"companySlogan"];
        NSString *path = [[NSBundle mainBundle] pathForResource:[company objectForKey:@"companyLogo"] ofType:@"png"];
        UIImage *theImage = [UIImage imageWithContentsOfFile:path];
        cell.imageView.image = theImage;
    } else {
        NSString *featureKey = [NSString stringWithFormat:@"feature%d", indexPath.item];
        
        cell.detailTextLabel.text = [company objectForKey:featureKey];
    
    }
    
    
    return cell;
}

-(NSDictionary *) getTableViewValuesAtIndex:(NSInteger)index{

    NSDictionary *company1 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Cabling Inc.", @"companyName",
                              @"Structured cabling, planning and consulting", @"companySlogan",
                              @"Logo1", @"companyLogo",
                              @"Supporting mission critical systems able to quickly and cost-efficiently adapt to emerging technologies.", @"feature1",
                              @"Specialized in voice, data, and fiber optic cabling and wireless LAN rollouts with high-quality, and standards-based", @"feature2",
                              @"Solutions that scale to accommodate bandwidth needs and  integrate with the latest technologies.", @"feature3",
                              @"End-to-end structured cabling solutions for a variety of industries. Whether one location or thousands,", @"feature4",
                              nil];
    
    NSDictionary *company2 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Security Network Inc.", @"companyName",
                              @"Pragmatic security services", @"companySlogan",
                              @"Logo2", @"companyLogo",
                              @"Identify and fix weaknesses and vulnerabilities from a technical, physical, and administrative perspective.", @"feature1",
                              @"Define the level of risk of operations,IT infrastructure, applications, wireless, sensitive data, and information", @"feature2",
                              @"Provide an action plan to correct the problems in terms of a remedial, tactical, and strategic approach", @"feature3",
                              @"Objective and independent advice with regard to the best alternatives for the implementation.", @"feature4",
                              nil];
    
    NSDictionary *company3 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Firewall Inc.", @"companyName",
                              @"Everything your company needs about Security", @"companySlogan",
                              @"Logo3", @"companyLogo",
                              @"We combine Operating System with custom processors and the latest-generation CPUs to provide advanced protection.", @"feature1",
                              @"choose from a broad range of world-class security capabilities and configuration options.", @"feature2",
                              @"Maximize protection and optimize performance across the full range of diverse security platforms.", @"feature3",
                              @"Processors deliver extremely High Performance, Ultra-low latency and unmatched scalability.", @"feature4",
                              nil];
    
    NSDictionary *company4 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Connected Inc.", @"companyName",
                              @"We make fiber come alive", @"companySlogan",
                              @"Logo4", @"companyLogo",
                              @"Providing fiber connectivity solutions that enable every modern Telecom, Cable and Wireless network.", @"feature1",
                              @"specialized optical connectorization solutions to applications outside the network as well", @"feature2",
                              @"Rapidly develop and reliably deploy both mass-produced and application-specific optical solutions.", @"feature3",
                              @"Reduce time, cost and the necessary skill levels needed to install advanced interoffice and GPON access networks", @"feature4",
                              nil];
    
    NSDictionary *company5 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Outsourcing Inc.", @"companyName",
                              @"Let us be in charge of what is not your core business.", @"companySlogan",
                              @"Logo5", @"companyLogo",
                              @"Access the world’s largest pool of vetted service providers with our next generation sourcing platform", @"feature1",
                              @"Submit without delay your project requirements, timeline and budget range using our brief app. ", @"feature2",
                              @"Once you select your service provider, platform guarantees the optimal price with a digital statement of work.", @"feature3",
                              @"Your services are delivered using online project management and collaboration system", @"feature4",
                              nil];
    
    NSDictionary *companies = [NSDictionary dictionaryWithObjectsAndKeys:
                               company1, @"1",
                               company2, @"2",
                               company3, @"3",
                               company4, @"4",
                               company5, @"5",
                               nil];
    
    NSString *dictionaryIndex = [NSString stringWithFormat:@"%d", index];
    
    return [companies objectForKey:dictionaryIndex];
    
}

@end
