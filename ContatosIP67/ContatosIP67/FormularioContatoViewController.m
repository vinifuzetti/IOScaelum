//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (void)pegaDadosDoFormulario{
    
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *email = [self.email text];
    NSString *endereco = [self.endereco text];
    NSString *site = [self.site text];
    
    if(!self.contato){
        self.contato = [Contato new];
    }
    
    self.contato.foto = [self.botaoImagem backgroundImageForState:UIControlStateNormal];
    self.contato.nome = nome;
    self.contato.telefone = telefone;
    self.contato.email = email;
    self.contato.endereco = endereco;
    self.contato.site = site;
    self.contato.latitude = [NSNumber numberWithFloat:[self.Latitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat:[self.Longitude.text floatValue]];
}

-(NSObject*)initWithCoder:(NSCoder *)aDecoder{
    //tipo construtor para criar array de contatos
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO instancia];
        self.navigationItem.title = @"Cadastro";
        if (self.contato) {
            UIBarButtonItem *alterar = [[UIBarButtonItem alloc]initWithTitle:@"Alterar"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(alteraContato)];
            
            self.navigationItem.rightBarButtonItem=alterar;
        }else{
            UIBarButtonItem *adicionar = [[UIBarButtonItem alloc]initWithTitle:@"Adicionar"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(adicionaContato)];
        
            self.navigationItem.rightBarButtonItem=adicionar;
        }
    }
    
    return self;
}

-(void)adicionaContato{
    [self pegaDadosDoFormulario];
    [self.dao adiciona:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)alteraContato{
    //O tratamento por ponteiro ja atualiza posicao da memoria do contato
    [self pegaDadosDoFormulario];
    if (self.delegate) {
        [self.delegate highlightNoContato: self.contato];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.contato) {
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain
                                      target:self action:@selector(alteraContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        self.Latitude.text = [self.contato.latitude stringValue];
        self.Longitude.text = [self.contato.longitude stringValue];
        if (self.contato.foto) {
            [self.botaoImagem setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
            [self.botaoImagem setTitle:@"" forState: UIControlStateNormal];
        }
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)selecionarFoto:(id)sender{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Escolher foto de:" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Biblioteca", nil];
        [sheet showInView:self.view];
    }else{
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(IBAction)buscarCoordenadas:(UIButton*)botaoCood{
    [self.loading startAnimating];
    botaoCood.hidden = YES;
    NSString *endContato = self.endereco.text;
    CLGeocoder *geo = [CLGeocoder new];
    [geo geocodeAddressString:endContato completionHandler:^(NSArray *resultados, NSError *erro){
        if (!erro && [resultados count]>0) {
            CLPlacemark *resultado = resultados[0];
            CLLocationCoordinate2D coord = resultado.location.coordinate;
            self.Latitude.text = [NSString stringWithFormat:@"%f", coord.latitude];
            self.Longitude.text = [NSString stringWithFormat:@"%f", coord.longitude];
        }
        [self.loading stopAnimating];
        botaoCood.hidden = NO;
    }];
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *foto = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoImagem setBackgroundImage:foto forState:UIControlStateNormal];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.botaoImagem setTitle:@"" forState: UIControlStateNormal];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            return;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

@end
