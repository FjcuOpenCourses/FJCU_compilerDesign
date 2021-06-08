//scanner.flex
import java_cup.runtime.*;
import java.io.*;
%%
%class scanner 
%line 
%column 
%cup
%unicode

%{
    public static void init(){}
    private Symbol symbol(int type){
        return new Symbol(type,yyline,yycolumn); 
    }
    private Symbol symbol(int type,Object value){
        return new Symbol(type,yyline,yycolumn,value);
    }
%}
digit=[0-9]
number={digit}
Charact = [A-Z]

%%
    {number} { return symbol(sym.NUMBER,new Integer(yytext())); }
    ";" { return symbol(sym.SEMI); }
    {digit} { return symbol(sym.NUMBER); }
    {Charact} { return symbol(sym.CHARRACT); }
 