require "./lexer/lexer"
require "./parser/parser"
require "./executors/interpreter"
require "./errors"

errLogger = ErrorLogger.new

evaluate(parse(tokenize("printf('hi') printf('yoski') int: age = 20 int: day = 201 readOutIntVar(day)"), errLogger))
errLogger.error_log()