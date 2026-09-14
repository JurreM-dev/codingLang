def evaluate(ast)
  puts "============= RUNNING PROGRAM ============"
  index = 0
  integer_vars = Hash(String, Int32).new
  string_vars = Hash(String, String).new
  while index < ast.size
    case ast[index]["type"]
      when "printing"
        puts ast[index]["value"]
      when "variableDeclarationInt"
        integer_vars[ast[index]["name"].as(String)] = ast[index]["value"].as(Int32)
      when "readIntVariable"
        puts integer_vars[ast[index]["value"]]
      when "variableDeclarationString"
        string_vars[ast[index]["name"].as(String)] = ast[index]["value"].as(String)
      else
        puts "error in interpreter"
      end
    index += 1
  end
  puts "=========================================="
end