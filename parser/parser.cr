require "./parser_functions"

alias AST_hash = Hash(String, String)
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
      ast_item = {"type" => "printing", "value" => value_current}
      ast << ast_item
    else 
      errLogger.add_error("ERROR, #{tokens[index][:value]} was not found as a valid statement\nlunarMyth, parser index:#{index}\n\n")
      index += 1
    end
  end
  return ast
end