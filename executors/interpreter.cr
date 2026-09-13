def evaluate(ast)
  puts "============= RUNNING PROGRAM ============"
  index = 0
  intenger_vars = Hash(String, Int32).new
  while index < ast.size
    case ast[index]["type"]
      when "printing"
        puts ast[index]["value"]
      when "variableDeclarationInt"
        intenger_vars[ast[index]["name"].as(String)] = ast[index]["value"].as(Int32)
      else
        puts "error in interpreter"
      end
    index += 1
  end
  puts "=========================================="
end