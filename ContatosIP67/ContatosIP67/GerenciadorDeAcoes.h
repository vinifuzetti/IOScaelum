//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios6400 on 15/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface GerenciadorDeAcoes : NSObject <UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contato *contato;
@property UIViewController *controller;
-(id)initWitchContato:(Contato*)contato;
-(void)acoesDoController:(UIViewController*)controller;
-(void)sendmail;
-(void)site;
-(void)mapa;
-(void)abrirAplicaticoComURL: (NSString*)url;

@end
