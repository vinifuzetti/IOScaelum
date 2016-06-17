//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
#import <CoreData/CoreData.h>

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

-(void)adiciona:(Contato*)contato;

+(ContatoDAO*)instancia;

-(Contato *)buscaContatoPosicao: (NSInteger)posicao;

-(void) removeContatoPosicao: (NSInteger)posicao;

-(Contato*) geraContato;

-(void)lista;

@end
