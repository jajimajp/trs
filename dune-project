(lang dune 3.16)
(using menhir 3.0)

(name trs)

(generate_opam_files true)

(source
 (github jajimajp/trs))

(authors "Soichi Yajima")

(maintainers "Soichi Yajima")

(license MIT)

(documentation https://github.com/jajimajp/trs/)

(package
 (name trs)
 (synopsis "Parsing library for the TRS format, the format for first-order rewrite systems")
 (description "trs is a parsing library for the TRS format, the format for first-order rewrite systems.")
 (depends ocaml dune menhir)
 (tags
  (trs "rewrite systems")))

