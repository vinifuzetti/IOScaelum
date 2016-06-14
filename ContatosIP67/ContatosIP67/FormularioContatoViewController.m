//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (void)pegaDadosDoFormulario{
//  NSLog(@"Botao Clicado");
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *email = [self.email text];
    NSString *endereco = [self.endereco text];
    NSString *site = [self.site text];
    
    Contato *contato = [Contato new];
    contato.nome = nome;
    contato.telefone = telefone;
    contato.email = email;
    contato.endereco = endereco;
    contato.site = site;
    
    [self.dao adiciona:contato];
}

-(NSObject*)initWithCoder:(NSCoder *)aDecoder{
    //tipo construtor para criar array de contatos
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO instancia];
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *adicionar = [[UIBarButtonItem alloc]initWithTitle:@"Adicionar"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(adicionaContato)];
        self.navigationItem.rightBarButtonItem=adicionar;
    }
    
    return self;
}

-(void)adicionaContato{
    [self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
