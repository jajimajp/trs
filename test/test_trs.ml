open Trs

let test_cases : (string (* input *) * string (* expected *)) list =
  [
    ( {|(VAR X Y Z)
(RULES
  +(x,+(y,z)) -> +(+(x,y),z)
  +(e,x) -> +(x,e)
  +(i(x),x) -> e
)
(COMMENT hello world)
|},
      {|(VAR X Y Z)
(RULES
  +(x,+(y,z)) -> +(+(x,y),z)
  +(e,x) -> +(x,e)
  +(i(x),x) -> e
)
(COMMENT hello world)
|}
    );
  ]

let test (input, expected) =
  let actual = Trs.of_string input |> Result.get_ok |> string_of_trs in
  if actual <> expected then
    let () =
      Printf.eprintf "FAIL:\nexpected:\n%s\nactual:\n%s\n" expected actual
    in
    raise (Failure "got unexpected result")

let () = List.iter test test_cases
