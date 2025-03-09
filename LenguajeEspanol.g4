grammar LenguajeEspanol;

gramatica
    : bloque EOF
    ;

bloque
    : (declaracion | bloqueControl)*
    ;

bloqueControl
    : asignacion
    | sentencia_si
    | sentencia_mientras
    | sentencia_para
    | imprimir
    | leer
    ;

declaracion
    : tipo VARIABLE (ASIGNA expresion)? PUNTOCOMA
    ;

asignacion
    : VARIABLE ASIGNA expresion PUNTOCOMA
    ;

sentencia_si
    : SI bloqueCondicional (TAMBIEN_SI bloqueCondicional)* (TAMBIEN bloqueDeControl)?
    ;

bloqueCondicional
    : ABREPARENTESIS expresion CIERRAPARENTESIS bloqueDeControl
    ;

bloqueDeControl
    : ABRELLAVE bloque CIERRALLAVE
    | bloqueControl
    ;

sentencia_mientras
    : MIENTRAS ABREPARENTESIS expresion CIERRAPARENTESIS bloqueDeControl
    ;

sentencia_para
    : PARA ABREPARENTESIS (declaracion | asignacion)? PUNTOCOMA expresion PUNTOCOMA expresion CIERRAPARENTESIS bloqueDeControl
    ;

imprimir
    : IMPRIMIR expresion PUNTOCOMA
    ;

leer
    : LEER VARIABLE PUNTOCOMA
    ;

expresion
    : expresion POTENCIA expresion           
    | MENOS expresion                        
    | expresion (MULTIPLICACION | DIVISION | MODULO) expresion  
    | expresion (MAS | MENOS) expresion      
    | VARIABLE MASMAS                       
    | expresion (MENORIGUAL | MAYORIGUAL | MAYOR | MENOR) expresion  
    | expresion (IGUAL | DIFERENTE) expresion  
    | expresion Y expresion                  
    | expresion O expresion                  
    | primitiva                             
    ;

primitiva
    : ABREPARENTESIS expresion CIERRAPARENTESIS
    | ENTERO
    | FLOTANTE
    | VERDADERO
    | FALSO
    | CADENA
    | VARIABLE
    ;

tipo
    : ENTERO_TIPO
    | FLOTANTE_TIPO
    | CADENA_TIPO
    | BOOLEANO_TIPO
    ;

SI : 'si';
TAMBIEN_SI : 'tambien_si';
TAMBIEN : 'tambien';
MIENTRAS : 'mientras';
PARA : 'para';
IMPRIMIR : 'imprimir';
LEER : 'leer';
ASIGNA : '=';
PUNTOCOMA : ';';
ABREPARENTESIS : '(';
CIERRAPARENTESIS : ')';
ABRELLAVE : '{';
CIERRALLAVE : '}';
MAS : '+';
MENOS : '-';
MULTIPLICACION : '*';
DIVISION : '/';
MODULO : '%';
POTENCIA : '^';
MENORIGUAL : '<=';
MAYORIGUAL : '>=';
MAYOR : '>';
MENOR : '<';
IGUAL : '==';
DIFERENTE : '!=';
Y : 'y';
O : 'o';
MASMAS : '++';
VERDADERO : 'verdadero';
FALSO : 'falso';
ENTERO_TIPO : 'entero';
FLOTANTE_TIPO : 'flotante';
CADENA_TIPO : 'cadena';
BOOLEANO_TIPO : 'booleano';
CADENA : '"' (~["\r\n])* '"';
VARIABLE : [a-zA-Z_][a-zA-Z0-9_]*;
ENTERO : [0-9]+;
FLOTANTE : [0-9]+ '.' [0-9]+;
WS : [ \t\r\n]+ -> skip;