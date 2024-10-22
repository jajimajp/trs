{
open Lexing
open Parser

exception SyntaxError of string
}

let white = [' ' '\t']+
let newline = ('\r' | '\n' | '\r' '\n')
let id = ['a'-'z' 'A'-'Z' '0'-'9' '_' '\'' '-' '+' '*' '/']+
let str = ['a'-'z' 'A'-'Z' '0'-'9' '_' '\'' '-' '+' '*' '/' ' ' '\t' '\r' '\n']+
let comment = ("(COMMENT " str ")")

rule token = parse
| white     { token lexbuf }
| newline   { new_line lexbuf; token lexbuf }
| comment   {
              let s = lexeme lexbuf in
              let len = String.length s in
                COMMENT_SECTION (String.sub s 9 (len - 10))
            }
| "("       { LPAREN }
| ")"       { RPAREN }
| "->"      { ARROW }
| ","       { COMMA }
| "VAR"     { VAR }
| "RULES"   { RULES }
| id        { ID (lexeme lexbuf) }
| eof       { EOF }
| _         { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

