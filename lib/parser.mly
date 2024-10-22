%token EOF

%token <Types.id> ID
%token <string> STRING
%token LPAREN
%token RPAREN
%token ARROW
%token COMMA

%token VAR
%token RULES
%token <string> COMMENT_SECTION

%start <Types.trs> trs
%type <string option> comment
%type <Types.id list> idlist
%type <Types.rule> rule
%type <Types.rule list> rules
%type <Types.rule list> rulelist

%%

trs:
| var=var; rules=rules; comment=comment; EOF
  { Types.({ var=Some var; rules; comment }) }
| rules=rules; comment=comment; EOF { Types.({ var=None; rules; comment }) }
;
var:
| LPAREN; VAR; idlist=idlist; RPAREN { idlist }
;
idlist:
|                      { [] }
| id=ID; idlist=idlist { id :: idlist }
;
rules:
| LPAREN; RULES; rulelist=rulelist; RPAREN { rulelist }
;
rulelist:
|                              { [] }
| rule=rule; rulelist=rulelist { rule :: rulelist }
;
rule:
| l=term; ARROW; r=term { (l, r) }
;
term:
| id=ID                 { Types.Var id }
| id=ID; LPAREN; RPAREN { Types.App (id, []) }
| id=ID; LPAREN; termlist=termlist; RPAREN { Types.App (id, termlist) }
;
termlist:
| term=term { [term] }
| term=term; COMMA; termlist=termlist { term :: termlist }
;
comment:
|                   { None }
| s=COMMENT_SECTION { Some s }
;

