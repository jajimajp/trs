type trs =
  { var : id list option
  ; rules : rule list
  ; comment : string option
  }

and rule = term * term

and term = Var of id | App of id * term list

and id = string
