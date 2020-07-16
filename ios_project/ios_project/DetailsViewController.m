//
//  DetailsViewController.m
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.context = self.delegate.persistentContainer.viewContext;
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    
    
    if(self.is_deleted == YES){
       self.saveBtn.title = @"Restore";
    } else {
        self.saveBtn.title = @"Save";
    }
    
    if (self.is_update == YES){
        self.category.text = self.note_details.category;
        self.text.text = self.note_details.text;
        self.noteTitle.text = self.note_details.title;
    }
}

- (IBAction)saveBtnTouched:(UIBarButtonItem *)sender {
    NSString *title = self.noteTitle.text;
    NSString *text = self.text.text;
    NSString *category = self.category.text;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MMM-yyyy HH:mm:ss"];
    
    NSDate *currentDate = [NSDate date];
    NSString *dateString = [formatter stringFromDate:currentDate];
    
    if ([category  isEqual: @""]){
        category = @"Uncategorized";
    }
    
    if (self.is_update == YES){
        //Update existing Note
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"noteID like %@",self.note_details.noteID];
        request.predicate = predicate;
        NSArray <Notes*> *Note = [self.context executeFetchRequest:request error:nil];
        Notes *wantedNote = Note[0];
        wantedNote.title = title;
        wantedNote.text = text;
        wantedNote.category = category;
        wantedNote.updated = dateString;
        
        if(self.is_deleted == YES){
            wantedNote.deleted = NO;
        }
        
        [self.delegate saveContext];
        
        if(self.is_deleted == YES){
            [self presentAlert:@"Note Restored Succesfuly!"];
        } else {
            [self presentAlert:@"Note Updated Succesfuly!"];
        }
        

    } else {
        //Create new Note
        NSString *UUID = [[NSUUID UUID] UUIDString];
        Notes *note = [[Notes alloc] initWithContext:self.context];
        note.noteID = UUID;
        note.title = title;
        note.text = text;
        note.category = category;
        note.updated = dateString;
        note.created = dateString;
        
        [self.delegate saveContext];
        [self presentAlert:@"Note Created Succesfuly!"];
    }
    
    
}

- (void) updateCategory:(NSString*) category{
    self.category.text = category;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"selectCategory"])
    {
        SelectExistingCategoryViewController *vc = [segue destinationViewController];
        vc.categoryDelegateObject = self;
    }
}

- (void) presentAlert: (NSString*) message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [[self navigationController] popViewControllerAnimated:NO];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
