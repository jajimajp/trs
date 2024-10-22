(lang dune 3.7)
(using menhir 2.1)

(name trs)

(generate_opam_files true)

(source
 (github jajimajp/trs))

(authors "Soichi Yajima")

(maintainers "Soichi Yajima")

(license MIT)

(package
 (name trs)
 (synopsis "Parsing library for the TRS format, the format for first-order rewrite systems")
 (description "trs is a parsing library for the TRS format, the format for first-order rewrite systems.")
 (depends
  (ocaml (>= 4.12.0))
  (dune (>= 3.7))
  (menhir (>= 20211012)))
 (tags
  (trs "rewrite systems")))

