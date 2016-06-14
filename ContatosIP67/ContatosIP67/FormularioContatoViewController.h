//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@interface FormularioContatoViewController : UIViewController

//@property gera auto o get e set da variavel privada
@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;

//@property NSMutableArray *contatos;
@property ContatoDAO* dao;

- (void)pegaDadosDoFormulario;

@end

