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
    
    if (self.is_update == YES){
        self.category.text = self.note_details.category;
        self.text.text = self.note_details.text;
        self.noteTitle.text = self.note_details.title
        ;
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
        [self.delegate saveContext];

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
    }
}


@end
