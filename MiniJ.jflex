
import java_cup.runtime.Symbol;
%%

%unicode
%cup
%class Lexer
%implements sym

%line
%column

%{
private Symbol symbol(int sym) {
    return new Symbol(sym, yyline+1, yycolumn+1);
}

private Symbol symbol(int sym, Object val) {
   return new Symbol(sym, yyline+1, yycolumn+1, val);
}

private void error(String message) {
   System.out.println("Error at line "+ (yyline+1) + ", column " + (yycolumn+ 1)+ " : "+message);
}
%}

LineEnd = [\r\n]|\r\n
Character = [^\r\n]
WhiteSpace = {LineEnd} | [ \t\f]

LineComment = "//" {Character}* {LineEnd}
CStyleComment = "/*" ~"*/"
Comment = {LineComment} | {CStyleComment}

String = "\"" ~"\""

Identifier = [:jletter:][:jletterdigit:]*


NumericConstant = [0-9]+

%%
<YYINITIAL> {
    {WhiteSpace} { /* Ignore */ }
    ";" { return symbol(SEMI); }
    "(" { return symbol(OBRACKET); }
    ")" { return symbol(CBRACKET); }
    "," { return symbol(COMMA); }
    ":=" { return symbol(ASSIGNATION); }
    "+" { return symbol(ADD); }
    "-" { return symbol(SUB); }
    "*" { return symbol(MULT); }
    "/" { return symbol(DIV); }
/**/
    "**" { return symbol(POW); }
    "%" { return symbol(MOD); }
    "and" { return symbol(AND); }
    "or" { return symbol(OR); }
    "not" { return symbol(NOT); }
    "=" { return symbol(EQL); }
    "<" { return symbol(LT); }
    ">" { return symbol(GT); }
    "<>" { return symbol(NEQL); }
    "<=" { return symbol(LE); }
    ">=" { return symbol(GE); }
    "read" { return symbol(READ); }
    "write" { return symbol(WRITE); }
    "clear" { return symbol(CLR); }
    "draw" { return symbol(DRAW); }
    "move" { return symbol(MOV); }
    "set color" { return symbol(SCOLOR); }
    "set line" { return symbol(SLINE); }
    "string" { return symbol(STRING); }
    "integer" { return symbol(INTOP); }
    "real" { return symbol(REAL); }
    "endif" { return symbol(EIF); }
    "if" { return symbol(IF); }
    "else" { return symbol(ELSE); }
    "then" { return symbol(THEN); }
    "while" { return symbol(WHILE); }
    "for" { return symbol(FOR); }
    "do" { return symbol(DO); }
    "enddo" { return symbol(EDO); }
    "to" { return symbol(TO); }
    "endfor" { return symbol(EFOR); }
    "return" { return symbol(RETURN); }
    "program" { return symbol(PROG); }
    "endprogram" { return symbol(ENDPROG); }
    "function" { return symbol(FUNC); }
    "endfunction" { return symbol(ENDFUNC); }

   {Comment} {}
   {String}  { System.out.println("STRING"); }
   {Identifier} { return symbol(ID, yytext());}

   {NumericConstant} {System.out.println("number");}
   .|\n { System.out.println("ERROR");error(yytext());}
 }
