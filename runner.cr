require "./lexer/lexer"
require "./parser/parser"
require "./executors/interpreter"
require "./errors"

errLogger = ErrorLogger.new
tokens = tokenize("printf('hi') printf('yoski') int: age = 20 int: day = 201 readOutIntVar(day)")
parser = Parser.new(tokens, errLogger)
ast = parser.parse
evaluate(ast)