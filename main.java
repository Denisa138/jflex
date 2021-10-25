//package jflex;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java_cup.runtime.Symbol;

public class main {
	static HashMap<Integer, String> tokenClass = new HashMap<Integer, String> ();

	public static void initHash()
	{
		//tokenClass.put(sym.RETURN, "Keyword");
		tokenClass.put(sym.INTOP, "Keyword");
		tokenClass.put(sym.ADD, "Operator");
		tokenClass.put(sym.SUB, "Operator");
		tokenClass.put(sym.DIV, "Operator");
		tokenClass.put(sym.GT, "Operator");
		tokenClass.put(sym.ASSIGNATION, "assignation");
		tokenClass.put(sym.EQL, "Operator");
		tokenClass.put(sym.ASSIGNATION, "Operator");
		tokenClass.put(sym.REAL, "Keyword");
		tokenClass.put(sym.WRITE, "Keyword");
		tokenClass.put(sym.STRING, "Keyword");
		tokenClass.put(sym.SEMI, "Separators");
		tokenClass.put(sym.OBRACKET, "Separators");
		tokenClass.put(sym.CBRACKET, "Separators");
		tokenClass.put(sym.NumericConstant, "numeric");
		tokenClass.put(sym.THEN, "then");


		tokenClass.put(sym.COMMA, "Separators");
		tokenClass.put(sym.IF, "Keyword");
		tokenClass.put(sym.EIF, "Keyword");
		tokenClass.put(sym.ID, "identificator");
		tokenClass.put(sym.PROG, "PROGRAM");
		tokenClass.put(sym.ENDPROG, "ENDPROGRAM");
		tokenClass.put(sym.FUNC, "FUNCTION");
		tokenClass.put(sym.ENDFUNC, "ENDFUNCTION");
	}

	public static void main (String[] args) {
		main.initHash();

		FileReader inputFile;
		try {
			inputFile = new FileReader("input.txt");
			BufferedReader br = new BufferedReader(inputFile);
			Lexer l = new Lexer(br);

			try {
				Symbol sCrt;
				do
				{
					//sCrt = l.yybegin();

					sCrt = l.next_token();
					System.out.println("symbol "+ sCrt.sym);
					if (sCrt.sym != sym.EOF)
					{
						System.out.println("Symbol value: "+ l.yytext() + " Class: " + main.tokenClass.get(sCrt.sym) + " line: " + sCrt.left + " column: " + sCrt.right);
					}
				}while(sCrt.sym != sym.EOF);
				System.out.println("EOF");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

}

