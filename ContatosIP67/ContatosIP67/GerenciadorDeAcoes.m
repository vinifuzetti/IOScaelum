//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios6400 on 15/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

-(id)initWitchContato:(Contato *)contato{
    self = [super init];
    if (self){
        self.contato = contato;
    }
    return self;
}

-(void)acoesDoController:(UIViewController *)controller{
    self.controller = controller;
    UIActionSheet *opcoes = [[UIActionSheet alloc]initWithTitle:self.contato.nome
                                                       delegate:self
                                              cancelButtonTitle:@"Cancelar"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Ligar", @"Site", @"Mapa", @"E-mail", nil];
    [opcoes showInView:controller.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self site];
            break;
        case 2:
            [self mapa];
            break;
        case 3:
            [self sendmail];
        default:
            break;
    }
}

-(void)ligar{
    UIDevice *device = [UIDevice currentDevice];
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString *numero = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
        [self abrirAplicaticoComURL:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Nao foi possivel fazer ligacao" message:@"POBRE, precisa ser iPhone" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

-(void)sendmail{
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mail = [MFMailComposeViewController new];
        [mail setToRecipients:@[self.contato.email]];
        mail.mailComposeDelegate = self;
        [self.controller presentViewController:mail animated:YES completion:nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Nao foi possivel enviar E-mail" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)site{
    NSString *url = self.contato.site;
    if (![url hasPrefix:@"http://"]) {
        url = [NSString stringWithFormat:@"http://%@", url];
    }
    [self abrirAplicaticoComURL:url];
}

-(void)mapa{
    NSString *url = [[NSString stringWithFormat:@"http://maps.apple.com/?q=%@", self.contato.endereco]
                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicaticoComURL:url];
}

-(void)abrirAplicaticoComURL: (NSString*)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
