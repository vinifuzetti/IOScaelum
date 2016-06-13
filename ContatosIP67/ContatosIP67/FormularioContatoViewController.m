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

- (IBAction)pegaDadosDoFormulario{
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
    
//  NSLog(@"Nome: %@, Telefone: %@, Email: %@, Endereco: %@, Site: %@", nome, telefone, email, endereco, site);
    [self.dao adiciona:contato];
//    NSLog(@"Dados: %@", contato);
}

-(NSObject*)initWithCoder:(NSCoder *)aDecoder{
    //tipo construtor para criar array de contatos
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO instancia];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
