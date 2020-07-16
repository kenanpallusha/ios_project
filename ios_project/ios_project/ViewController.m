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
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.context = self.delegate.persistentContainer.viewContext;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fetchAllNotes];
    [self.notesTableView reloadData];
    
}

- (void) fetchAllNotes{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
    NSSortDescriptor *modifiedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"updated" ascending:NO];
    request.sortDescriptors = @[modifiedDescriptor];
    self.notes = [self.context executeFetchRequest:request error:nil];
}





- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"cell";
    
    AllNotesTableViewCell *cell = (AllNotesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    Notes *note = self.notes[indexPath.row];
    
    cell.title.text = note.title;
    cell.text.text = note.text;
    
    NSString *modified = [NSString stringWithFormat:@"Modified: %@ / Created: %@", note.updated, note.created];
    
    cell.modified.text = modified;
    cell.text.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Notes *note = self.notes[indexPath.row];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"detailsViewController"];
    vc.is_update = YES;
    vc.note_details = note;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)addNewNote:(UIBarButtonItem *)sender {
    NSLog(@"Add new note selected");
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"detailsViewController"];
    vc.is_update = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showCategories"])
    {
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
        self.notes = [self.context executeFetchRequest:request error:nil];
        
        NSMutableArray *catArr = [NSMutableArray array];
        
        for(Notes *note in self.notes) {
            if (![catArr containsObject:note.category]){
                [catArr addObject:note.category];
            }
            
        }
        CategoriesViewController *vc = [segue destinationViewController];
        //NSArray *categoriesToSend = [NSArray arrayWithArray:catArr];
        //NSLog(categoriesToSend[0]);
        vc.categories = catArr;
    }
}



@end
