//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

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
        self.linhaPintada = -1;
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
    formulario.delegate = self;
    
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

-(void)viewWillAppear:(BOOL)animated{
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

-(void)highlightNoContato: (Contato*)contato{
    self.linhaPintada = [self.dao.contatos indexOfObject:contato];
}

-(void)viewDidAppear:(BOOL)animated{
    if(self.linhaPintada > -1){
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.linhaPintada inSection:0];
        [self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        self.linhaPintada = -1;
    }
}

-(void)viewDidLoad{
    UILongPressGestureRecognizer *longClick = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(menuContato:)];

    [self.tableView addGestureRecognizer:longClick];
}

-(void)menuContato:(UIGestureRecognizer*) gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *path = [self.tableView indexPathForRowAtPoint:ponto];
        if (path) {
            self.ContatoSel = [self.dao buscaContatoPosicao:path.row];
            _gerenciador = [[GerenciadorDeAcoes alloc]initWitchContato:self.ContatoSel];
            [self.gerenciador acoesDoController:self];
        }
    }
}

@end
