require "./lexer/lexer"
require "./parser/parser"
require "./executors/interpreter"
evaluate(parse(tokenize("printf('hi') printf('yoski') test")))