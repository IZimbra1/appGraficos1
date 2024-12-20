//
//  Canvas.h
//  appGraficos1
//
//  Created by Guest User on 27/09/24.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Canvas : NSView

-(NSPoint) randomPoint;

-(void) dibujaLinea;
-(void) dibujaPoligono;

-(void) dibujarGradienteRadial;
-(void) dibujarGradienteRadial2;


-(void)dibujarSuperman;
@end

NS_ASSUME_NONNULL_END
