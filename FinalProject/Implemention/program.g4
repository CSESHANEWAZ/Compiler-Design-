grammar program ;
start: declaration func;
declaration: '@' declist dectype ';' ;
declist : 'Include' | 'Define' ;
dectype : term '_' term ;
term : ID | Digit | ID op Digit;

func: 'main' 'start' '[' ']' parenmain ;
parenmain: 'beginmain' statement 'endmain';
statement: ( 
              variable_declare 
            | loop
		    | if_cond
			| countstat
			| breakstat
			| display
			| returntype
             )+
		     ;
variable_declare: declare '.';
declare: term relop term | term term;
var: ID ;
incr_decr : '++'| '--' ;
op : 'plus' | 'minus' | 'multiply' | 'devide' | 'mod' ;
relop : 'equal to' | 'not equal' | 'greater than equal' | 'less than' | 'greater than' | 'less than equal' | '=' | '==' ;

loop:  loopstmt ;		
loopstmt: 'for''['cond']' parenfor ;
cond: var'='term ';' var relop term ';' var incr_decr | term op term relop term | term relop term ;
parenfor: 'beginfor' statement 'endfor' ;
parenif: 'beginif' statement 'endif' ;
parenelif: 'beginelif' statement 'endelif' ;

if_cond: 'if' '[' cond ']' parenif | 'if' '[' cond ']' parenif 'elif' parenelif ;	
countstat: term incr_decr '.' ;
breakstat: 'break' '.';

display: 'print' '[' term ']' '.' ;
returntype: 'return' term '.';
ID : [a-zA-Z]+ ;
Digit : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;