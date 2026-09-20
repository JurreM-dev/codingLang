require "./lexer/lexer"
require "./parser/parser"
require "./executors/interpreter"
require "./errors"
require "./savingSystem/saving"

errLogger = ErrorLogger.new
fileContent = ""

if(ARGV[0])
  file = ARGV[0]
  unless file.ends_with?(".myth")
    errLogger.add_error("ERROR, expected .myth file")
    errLogger.error_log()
    exit(1)
  end
  unless File.exists?(file)
    errLogger.add_error("ERROR, file #{file} foes not exist")
    errLogger.error_log()
    exit(1)
  end
  fileContent = File.read(ARGV[0])
  tokens = tokenize(fileContent)
  parser = Parser.new(tokens, errLogger)
  ast = parser.parse
  evaluate(ast)
else 
  errLogger.add_error("ERROR, expected a file to parse")
  errLogger.error_log()
end