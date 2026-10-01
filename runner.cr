require "./lexer/lexer"
require "./parser/parser"
require "./executors/interpreter"
require "./errors"
require "./savingSystem/saving"

errLogger = ErrorLogger.new
fileContent = ""
saver = Saving.new(errLogger)

if(ARGV[0])
  file = ARGV[0]
  unless file.ends_with?(".myth")
    errLogger.fatalErr("ERROR, expected .myth file")
  end
  unless File.exists?(file)
    errLogger.fatalErr("ERROR, file #{file} foes not exist")
  end
  fileContent = File.read(ARGV[0])
  tokens = tokenize(fileContent)
  parser = Parser.new(tokens, errLogger)
  ast = parser.parse
  evaluate(ast)
else 
  errLogger.fatalErr("ERROR, expected a file to parse")
end