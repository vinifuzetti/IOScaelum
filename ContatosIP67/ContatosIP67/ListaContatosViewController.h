//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ContatoDAO.h"
#import "FormularioContatoViewController.h"

@interface ListaContatosViewController : UITableViewController <Pintor, UIActionSheetDelegate>

@property ContatoDAO *dao;
@property Contato *ContatoSel;
@property NSInteger linhaPintada;

-(void)abreForm;
-(void)highlightNoContato: (Contato*)contato;
-(void)menuContato:(UIGestureRecognizer*) gesture;
@end
