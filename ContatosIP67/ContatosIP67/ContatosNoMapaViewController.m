//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 16/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatosNoMapaViewController.h"

@interface ContatosNoMapaViewController ()

@end

@implementation ContatosNoMapaViewController

-(id)init{
    self = [super init];
    if (self){
        UIImage *imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:@"Mapa" image:imagemTabItem tag:0];
        self.navigationItem.title = @"Localizacao";
        self.tabBarItem = tabItem;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    MKUserTrackingBarButtonItem *botaoGPS = [[MKUserTrackingBarButtonItem alloc]initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = botaoGPS;
    
    self.manager = [CLLocationManager new];
    
    [self.manager requestWhenInUseAuthorization];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
