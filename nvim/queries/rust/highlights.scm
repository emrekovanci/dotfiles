; extends

; https://github.com/zed-industries/zed/blob/main/crates/languages/src/rust/highlights.scm

(attribute_item (attribute [
  (identifier) @attribute
  (scoped_identifier name: (identifier) @attribute)
  (token_tree (identifier) @attribute (#match? @attribute "^[a-z\\d_]*$"))
  (token_tree (identifier) @none "::" (#match? @none "^[a-z\\d_]*$"))
]))

(inner_attribute_item (attribute [
  (identifier) @attribute
  (scoped_identifier name: (identifier) @attribute)
  (token_tree (identifier) @attribute (#match? @attribute "^[a-z\\d_]*$"))
  (token_tree (identifier) @none "::" (#match? @none "^[a-z\\d_]*$"))
]))
