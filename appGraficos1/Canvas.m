//
//  Canvas.m
//  appGraficos1
//
//  Created by Guest User on 27/09/24.
//

#import "Canvas.h"

@implementation Canvas

-(NSPoint) randomPoint
{
    NSPoint resultado;
    NSRect r = [self bounds];
    
    // Comentado para usar arc4random
    // resultado.x = r.origin.x + random() % (int) r.size.width;
    // resultado.y = r.origin.y + random() % (int) r.size.height;
    
    // Implementación con arc4random
    resultado.x = r.origin.x + arc4random_uniform((unsigned int) r.size.width);
    resultado.y = r.origin.y + arc4random_uniform((unsigned int) r.size.height);
    
    return  resultado;
}

- (void)drawRect:(NSRect)dirtyRect {
    
    // Código de dibujo aquí
    
    /*
    NSRect rectangulo = [self bounds];
    [[NSColor colorWithDeviceRed:0.2 green:0.755 blue:0.755 alpha:1.0f] set];
    [NSBezierPath fillRect:rectangulo];
    
    [[NSColor orangeColor] set];
    
    srandom((unsigned)time(NULL));
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:3.0];
    NSPoint p = [self randomPoint];
    [path moveToPoint:p];
    for(int i=0; i<15; i++)
    {
        p = [self randomPoint];
        [path lineToPoint:p];
    }
    
    [path stroke];
    [path fill];
     */
    
    // Llamar a la función para dibujar la línea
    //[self dibujaLinea];
    
    // Llamar a la función para dibujar la estrella
    //[self dibujaEstrella];
    
    // Llamar a la función para dibujar el polígono
    //[self dibujaPoligono];
    
    //[self dibujarGradienteRadial];
    //[self dibujarGradienteRadial2];
    
    //[self dibujarCurvaBezier];
    //[self dibujarCurvaBezier2];
    //[self dibujarCurvaBezierInvertido];
    //[self dibujarFormasAbstractasInvertidas];
    [self dibujarSuperman];
}

-(void) dibujaLinea
{
    [[NSColor orangeColor] set];
    [NSBezierPath setDefaultLineCapStyle:NSLineCapStyleButt];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:5.0];
    [path moveToPoint:NSMakePoint(50.0, 50.0)];
    [path lineToPoint:NSMakePoint(200.0, 200.0)];
    [path setLineCapStyle:NSLineCapStyleButt];
    
    [path stroke];
}

-(void) dibujaEstrella
{
    [[NSColor redColor] set];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:3.0];
    
    // Centro y radio de la estrella
    NSPoint center = NSMakePoint(150.0, 150.0);
    CGFloat radius = 50.0;
    
    // Dibujar una estrella de 5 picos
    CGFloat angle = 4.0 * M_PI / 5.0; // Ángulo entre los picos
    [path moveToPoint:NSMakePoint(center.x, center.y + radius)];
    
    for(int i = 1; i < 5; i++)
    {
        CGFloat x = radius * sinf(i * angle);
        CGFloat y = radius * cosf(i * angle);
        [path lineToPoint:NSMakePoint(center.x + x, center.y + y)];
    }
    
    [path closePath];
    [path stroke];
}

-(void) dibujaPoligono
{
    /*
    [[NSColor greenColor] set];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:3.0];
    
    // Dibujar un pentágono
    NSPoint center = NSMakePoint(250.0, 250.0);
    CGFloat radius = 40.0;
    CGFloat angle = 2.0 * M_PI / 5.0; // Ángulo entre los vértices
    
    [path moveToPoint:NSMakePoint(center.x, center.y + radius)];
    
    for(int i = 1; i < 5; i++)
    {
        CGFloat x = radius * sinf(i * angle);
        CGFloat y = radius * cosf(i * angle);
        [path lineToPoint:NSMakePoint(center.x + x, center.y + y)];
    }
    
    [path closePath];
    [path stroke];
     */
    
    [[NSColor whiteColor]set];
    NSBezierPath *path = [[NSBezierPath alloc]init];
    [path setLineWidth:3];
    NSPoint punto;
    
    punto.x = 5;
    punto.y = 5;
    [path moveToPoint:punto];
    punto.x = 100;
    punto.y = 5;
    [path lineToPoint:punto];
    punto.x = 5;
    punto.y = 5;
    [path lineToPoint:punto];
    
    [path stroke];
    [path fill];
    
    
    int fig[4][3] = {{5,5},{100,5},{5,100},{5,5}};
    [path stroke];
    [path fill];
    
}

-(void)dibujarGradienteRadial{
    NSRect bounds = [self bounds];
    NSGradient *gradiente = [[NSGradient alloc]initWithStartingColor:[NSColor yellowColor] endingColor:[NSColor redColor]];
    
    NSPoint centerPoint = NSMakePoint(NSMidX(bounds),NSMidY(bounds));
    NSPoint otherPoint = NSMakePoint(centerPoint.x + 60, centerPoint.y + 60);
    CGFloat firstRadius = MIN((bounds.size.width/2.0),(bounds.size.height/2)-2.0);
    
    [gradiente drawFromCenter:centerPoint radius:firstRadius toCenter:otherPoint radius:2 options:0];
    [self dibujaPoligono];
}

-(void)dibujarGradienteRadial2{
    NSRect bounds = [self bounds];
    
   
    NSGradient *gradiente = [[NSGradient alloc] initWithStartingColor:[NSColor blueColor] endingColor:[NSColor greenColor]];
    
  
    NSPoint centerPoint = NSMakePoint(NSMidX(bounds), NSMidY(bounds));
    
   
    NSPoint otherPoint = NSMakePoint(centerPoint.x + 60, centerPoint.y + 60);
    
    
    CGFloat firstRadius = MIN(bounds.size.width / 4.0, bounds.size.height / 4.0); // un poco más pequeño que el primer gradiente
    

    [gradiente drawFromCenter:centerPoint radius:firstRadius toCenter:otherPoint radius:2 options:0];
}


-(void)dibujarSuperman {
    
    CGFloat ancho = [self bounds].size.width;
    CGFloat alto = [self bounds].size.height;

    
    CGFloat escalaX = ancho / 24.0;
    CGFloat escalaY = alto / 16.0;


    [[NSColor redColor] set];
    NSBezierPath *escudo = [NSBezierPath bezierPath];
    [escudo moveToPoint:NSMakePoint(12 * escalaX, alto - (0 * escalaY))];
    [escudo lineToPoint:NSMakePoint(24 * escalaX, alto - (12 * escalaY))];
    [escudo lineToPoint:NSMakePoint(20 * escalaX, alto - (16 * escalaY))];
    [escudo lineToPoint:NSMakePoint(4 * escalaX, alto - (16 * escalaY))];
    [escudo lineToPoint:NSMakePoint(0 * escalaX, alto - (12 * escalaY))];
    [escudo closePath];
    [escudo stroke];

  
    [[NSColor yellowColor] set];
    NSBezierPath *parteSuperiorIzquierda = [NSBezierPath bezierPath];
    [parteSuperiorIzquierda moveToPoint:NSMakePoint(2 * escalaX, alto - (12 * escalaY))];
    [parteSuperiorIzquierda lineToPoint:NSMakePoint(4 * escalaX, alto - (10 * escalaY))];
    [parteSuperiorIzquierda lineToPoint:NSMakePoint(4 * escalaX, alto - (12 * escalaY))];
    [parteSuperiorIzquierda lineToPoint:NSMakePoint(5 * escalaX, alto - (14 * escalaY))];
    [parteSuperiorIzquierda lineToPoint:NSMakePoint(7 * escalaX, alto - (15 * escalaY))];
    [parteSuperiorIzquierda lineToPoint:NSMakePoint(5 * escalaX, alto - (15 * escalaY))];
    [parteSuperiorIzquierda closePath];
    [parteSuperiorIzquierda fill];

    
    NSBezierPath *trianguloInferior = [NSBezierPath bezierPath];
    [trianguloInferior moveToPoint:NSMakePoint(12 * escalaX, alto - (2 * escalaY))];
    [trianguloInferior lineToPoint:NSMakePoint(15 * escalaX, alto - (5 * escalaY))];
    [trianguloInferior lineToPoint:NSMakePoint(9 * escalaX, alto - (5 * escalaY))];
    [trianguloInferior closePath];
    [trianguloInferior fill];

 
    NSBezierPath *curvaCentral = [NSBezierPath bezierPath];
    [curvaCentral moveToPoint:NSMakePoint(5 * escalaX, alto - (9 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(8 * escalaX, alto - (8 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(12 * escalaX, alto - (8 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(16 * escalaX, alto - (7 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(14 * escalaX, alto - (6 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(12 * escalaX, alto - (6 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(10 * escalaX, alto - (7 * escalaY))];
    [curvaCentral lineToPoint:NSMakePoint(7.5 * escalaX, alto - (6 * escalaY))];
    [curvaCentral closePath];
    [curvaCentral fill];

    
    NSBezierPath *parteInferiorDerecha = [NSBezierPath bezierPath];
    [parteInferiorDerecha moveToPoint:NSMakePoint(19 * escalaX, alto - (9 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(22 * escalaX, alto - (12 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(20 * escalaX, alto - (14 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(20 * escalaX, alto - (12 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(16 * escalaX, alto - (12 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(14 * escalaX, alto - (14 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(12 * escalaX, alto - (15 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(8 * escalaX, alto - (14 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(7 * escalaX, alto - (13 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(8 * escalaX, alto - (12 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(12 * escalaX, alto - (11 * escalaY))];
    [parteInferiorDerecha lineToPoint:NSMakePoint(16 * escalaX, alto - (11 * escalaY))];
    [parteInferiorDerecha closePath];
    [parteInferiorDerecha fill];
}

@end
    
