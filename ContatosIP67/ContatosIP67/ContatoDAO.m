//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO
static ContatoDAO *instancia;

-(void)adiciona:(Contato*)contato {
    NSLog(@"Adicionado: %@", contato);
    [self.contatos addObject:contato];
}

-(id)init {
    self = [super init];
    if(self){
        _contatos=[NSMutableArray new];
    }
    return self;
}

+(ContatoDAO*)instancia{
    if(!instancia){
        instancia = [ContatoDAO new];
    }
    return instancia;
}

-(Contato *)buscaContatoPosicao: (NSInteger)posicao{
    return self.contatos[posicao];
}

-(void) removeContatoPosicao: (NSInteger)posicao {
    [self.contatos removeObjectAtIndex:posicao];
}

@end
