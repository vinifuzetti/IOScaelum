//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

-(id)init{
    self = [super init];
    if (self) {
        UIBarButtonItem* adiciona = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                    target:self
                                    action:@selector(abreForm)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(void) abreForm{
    /*
     //Alerta
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"XaZam"
                                                                   message:@"Is we who fly big witcher!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    //Saida do alerta com botao OK - default
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
     */
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:nil];
    FormularioContatoViewController *formulario = [board instantiateViewControllerWithIdentifier:@"form"];
    
    [self.navigationController pushViewController:formulario animated:YES];
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    return [self.dao.contatos count];
}
@end
