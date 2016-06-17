//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "Contato.h"
#import <CoreLocation/CoreLocation.h>

@protocol Pintor <NSObject>
-(void)highlightNoContato:(Contato*)contato;

@end
@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

//@property gera auto o get e set da variavel privada
@property id <Pintor> delegate;
@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;
@property IBOutlet UITextField *Latitude;
@property IBOutlet UITextField *Longitude;

@property IBOutlet UIButton *botaoImagem;
@property IBOutlet UIActivityIndicatorView *loading;

//@property NSMutableArray *contatos;
@property ContatoDAO *dao;
@property Contato *contato;
//@property ListaContatosViewController *lista;

-(void)pegaDadosDoFormulario;

-(void)adicionaContato;

-(void)alteraContato;

-(IBAction)selecionarFoto:(id)sender;

-(IBAction)buscarCoordenadas:(UIButton*)botaoCood;

@end

