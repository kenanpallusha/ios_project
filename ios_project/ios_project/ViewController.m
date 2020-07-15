//
//  ViewController.m
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}





- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"cell";
    
    AllNotesTableViewCell *cell = (AllNotesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    cell.title.text = @"Do something";
    cell.text.text = @"To answer your question what is the difference between .h and .m files, .h files contain the declaration for your class, so basically all of attributes and methods that it can utilise. The .m file is the implementation of these methods.In laymans terms, the header file (.h) is the a way of saying This is what I can do and the .m is This is how I do it. It's a little more complicated then that though.";
    cell.text.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //DetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"detailsViewController"];
//NSString *rowselected = [NSString stringWithFormat:@"%li",(long)indexPath.row];

// NSString* combinedString = [@"HELLO DU BIST AFFENN with row: "  stringByAppendingString: rowselected];
    
//    vc.note_details = @"HELLOOOO";
//    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)addNewNote:(UIBarButtonItem *)sender {
    NSLog(@"Add new note selected");
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"detailsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
