//
//  Contato.m
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato
-(NSString*)description{
    return [NSString stringWithFormat:@"%@ - %@", self.nome, self.telefone];
}

@end
