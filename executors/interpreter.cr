def evaluate(ast)
  puts "============= RUNNING PROGRAM ============"
  index = 0
  while index < ast.size
    case ast[index]["type"]
      when "printing"
        puts ast[index]["value"]
      else
        puts "error in interpreter"
    end
    index += 1
  end
  puts "=========================================="
end