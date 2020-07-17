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
    self.to_show = @"ALL";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self selectDataToShow];
    [self.notesTableView reloadData];
    
}

- (void) selectDataToShow{
    if ([self.to_show  isEqual: @"ALL"]){
        [self fetchAllNotes:@"deleted = NO"];
        self.navigationController.topViewController.title = @"All Notes";
    } else if([self.to_show  isEqual: @"BIN"]){
        [self fetchAllNotes:@"deleted = YES"];
        self.navigationController.topViewController.title =  @"Deleted Notes";
    } else {
        self.navigationController.topViewController.title = self.to_show;
        [self fetchCategories:self.to_show];
    }
}

- (void) fetchAllNotes:(NSString*)show_trash{
   
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
    NSSortDescriptor *modifiedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"updated" ascending:NO];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:show_trash];
    request.predicate = predicate;
    request.sortDescriptors = @[modifiedDescriptor];
    self.notes = [self.context executeFetchRequest:request error:nil];
}

- (void) fetchCategories:(NSString*)category{
    
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
    NSSortDescriptor *modifiedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"updated" ascending:NO];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"deleted = NO and category like %@", category];
    request.predicate = predicate;
    request.sortDescriptors = @[modifiedDescriptor];
    self.notes = [self.context executeFetchRequest:request error:nil];
}





- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.notes.count > 0){
        self.noNotesLbl.alpha = 0.0;
    } else {
        self.noNotesLbl.alpha = 1.0;
    }
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
    if([self.to_show  isEqual: @"BIN"]){
        vc.is_deleted = YES;
    } else {
        vc.is_deleted = NO;
    }
    vc.note_details = note;
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Notes *note = self.notes[indexPath.row];
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"noteID like %@", note.noteID];
        request.predicate = predicate;
        NSArray <Notes*> *Note = [self.context executeFetchRequest:request error:nil];
        Notes *wantedNote = Note[0];
        
        if ([self.to_show  isEqual: @"BIN"]){
           [self.context deleteObject:wantedNote];
        } else {
            wantedNote.deleted = YES;
        }
        
        
        [self.delegate saveContext];
        [self selectDataToShow];
        [self.notesTableView reloadData];

    }
}

- (IBAction)addNewNote:(UIBarButtonItem *)sender {
    NSLog(@"Add new note selected");
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"detailsViewController"];
    vc.is_update = NO;
    vc.is_deleted = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showCategories"])
    {
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"deleted = NO"];
        request.predicate = predicate;
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
