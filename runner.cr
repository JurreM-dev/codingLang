require "./lexer/lexer"
require "./parser/parser"

puts parse(tokenize("printf('hi') printf('yoski') test"))