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

@interface ListaContatosViewController : UITableViewController

@property ContatoDAO *dao;

@end
