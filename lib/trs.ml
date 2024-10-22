include Types

let rec string_of_trs { var; rules; comment } : string =
  string_of_var var ^ string_of_rules rules ^ string_of_comment comment

and string_of_var = function
  | None -> ""
  | Some [] -> "(VAR)\n"
  | Some ls -> "(VAR " ^ String.concat " " ls ^ ")\n"

and string_of_rules rules =
  let rules =
    rules
    |> List.map (fun rule -> "  " ^ string_of_rule rule)
    |> String.concat "\n"
  in
  Printf.sprintf "(RULES\n%s\n)\n" rules

and string_of_rule (l, r) : string =
  string_of_term l ^ " -> " ^ string_of_term r

and string_of_term = function
  | Var id -> id
  | App (f, args) ->
      let args = args |> List.map string_of_term |> String.concat "," in
      Printf.sprintf "%s(%s)" f args

and string_of_id = Fun.id

and string_of_comment = function
  | None -> ""
  | Some s -> "(COMMENT " ^ s ^ ")\n"

let to_string = string_of_trs

let of_string_exn s =
  let lex = Lexing.from_string s in
  Parser.trs Lexer.token lex

let trs_of_string s = try Ok (of_string_exn s) with e -> Error e
let of_string = trs_of_string
