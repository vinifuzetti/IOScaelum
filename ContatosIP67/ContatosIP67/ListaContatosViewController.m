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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO instancia];
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
    
    formulario.contato = _ContatoSel;
    
    [self.navigationController pushViewController:formulario animated:YES];
    
    _ContatoSel = nil;
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    return [self.dao.contatos count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)table{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)index{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Contato *contato = [self.dao buscaContatoPosicao: index.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
    
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)table commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)index{
    if (style == UITableViewCellEditingStyleDelete) {
        //[self.dao.contatos removeObjectAtIndex:index.row];
        [self.dao removeContatoPosicao:index.row];
        [table deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _ContatoSel = [self.dao buscaContatoPosicao:indexPath.row];
    [self abreForm];
}

@end
