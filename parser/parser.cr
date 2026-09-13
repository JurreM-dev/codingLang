require "./parser_functions"

alias AST_hash = Hash(String, String | Int32)
def parse(tokens, errLogger) 
  ast = Array(AST_hash).new
  index = 1
  while index < tokens.size
    case tokens[index][:value]
  
    when "printf"
      _, index = eat("IDENTIFIER", tokens, index)
      _, index = eat("LPARA", tokens, index)
      used_value, index = eat("STRING", tokens, index)
      _, index = eat("RPARA", tokens, index)
      value_current = used_value[:value]
      ast_item = AST_hash{"type" => "printing", "value" => value_current}
      ast << ast_item
    when "int"
      _, index = eat("IDENTIFIER", tokens, index)
      _, index = eat("COLON", tokens, index)
      name, index = eat("IDENTIFIER", tokens, index)
      _, index = eat("EQUALS", tokens, index)
      used_value, index = eat("NUM", tokens, index)
      varName = name[:value]
      value_current = used_value[:value]
      value_current = value_current.to_i
      if value_current.is_a?(Int32)
        ast_item = AST_hash{"type" => "variableDeclarationInt", "name" => varName, "value" => value_current}
      else
  errLogger.add_error("ERROR, expected an intenger but got: #{typeof(value_current)}\nlunarMyth, parser index:#{index}")
      end
    else 
      errLogger.add_error("ERROR, #{tokens[index][:value]} was not found as a valid statement\nlunarMyth, parser index:#{index}\n\n")
      index += 1
    end
  end
  return ast
end