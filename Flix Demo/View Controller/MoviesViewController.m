//
//  MoviesViewController.m
//  Flix Demo
//
//  Created by Divine Uchechukwu Linus on 6/25/20.
//  Copyright © 2020 Divine Uchechukwu Linus. All rights reserved.
//

#import "MoviesViewController.h"

@interface MoviesViewController ()

@property (nonatomic, strong) NSArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

               NSLog(@"%@", dataDictionary);
               
               self.movies = dataDictionary [@"results"];
               for (NSDictionary *movie in self.movies) {
                   NSLog(@"%@", movie[@"title"]);
               }
               // TODO: Get the array of movies
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
       }];
    [task resume];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
