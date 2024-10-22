(* Copyright (c) 2024 Soichi Yajima <jajima.jp@gmail.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE. *)

(** A library for parsing and emitting TRS.

    This library provides functionality for handling the TRS format.
    With {!to_string} and {!of_string}, you can convert between a TRS string
    and the {!trs} type. The specifications for the TRS format can be found
    {{:https://project-coco.uibk.ac.at/problems/trs.php} here}. *)

(** {2 Types} *)

type trs =
  { var : id list option
  ; rules : rule list
  ; comment : string option
  }
(** [trs] is the representation of TRS format.
    Each record field corresponds to section if TRS: VAR, RULES, and COMMENT. *)

and rule = term * term
(** [rule] is a rewrite rule. [(left, right)] represents {b left -> right} *)

(** A term of TRS. *)
and term = Var of id | App of id * term list

and id = string
(** Identifier in terms. *)

(** {2 Parsers and serialisers} *)

val of_string : string -> (trs, exn) result
(** [of_string s] parses [s] into a {!trs} value. *)

val of_string_exn : string -> trs
(** [of_string s] parses [s] into {!trs}.
    Raises [Invalid_argument] if there is an error. *)

val to_string : trs -> string
(** [to_string trs] converts a {!trs} value into a string. *)

(** {2 Printers} *)

val string_of_trs : trs -> string
(** The same as {!to_string}. *)

val string_of_rule : rule -> string
val string_of_term : term -> string
val string_of_id : id -> string

