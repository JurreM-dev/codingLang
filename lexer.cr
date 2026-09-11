def tokenize(content)
  chars = content.split("")
  index = 0
  return_chars = [{type: "VOID", value: ""}]
  while index < content.size
    if(/\s/.match(chars[index]))

    elsif(/[a-zA-Z]/.match(chars[index]))
      string = chars[index]
      next_index = index + 1
      while next_index < chars.size && /[a-zA-Z0-9_]/.match(chars[next_index])
        string += chars[next_index]
        index += 1
        next_index += 1
      end
      return_chars.push({
        type: "IDENTIFIER",
        value: string
      })

    elsif(chars[index] == "=")
      if(chars[index + 1] == "=")
        return_chars.push({
          type: "CHECKEQUALS",
          value: "=="
        })
        index += 1
      else
      return_chars.push({
        type: "EQUALS",
        value: "="
      })
      end

    elsif(chars[index] == "'") 
      next_index = index + 1
      string = ""
      while next_index < chars.size && chars[next_index] != "'"
        string += chars[next_index]
        next_index += 1
        index += 1
      end
      index += 1
      return_chars.push({
        type: "STRING",
        value: string
      })
    elsif(/\d/.match(chars[index]))
      value = chars[index]
      next_index = index + 1
      while next_index < chars.size && /\d/.match(chars[next_index])
        value += chars[next_index]
        index += 1
        next_index += 1
      end
      return_chars.push({
        type: "NUM",
        value: value
      })
    elsif(chars[index] == "/"); return_chars.push({type: "FDASH", value: "/"})
    elsif(chars[index] == "\\"); return_chars.push({type: "LDASH", value: "\\"})
    elsif(chars[index] == "("); return_chars.push({type: "LPARA", value: "("})
    elsif(chars[index] == ")"); return_chars.push({type: "RPARA", value: ")"})
    elsif(chars[index] == "{"); return_chars.push({type: "LBRACE", value: "{"})
    elsif(chars[index] == "}"); return_chars.push({type: "RBRACE", value: "}"})
    else 
      return_chars.push({
        type: "VOID",
        value: chars[index]
      })
    end
  index += 1
  end
return return_chars
end

def eat(expectedType, tokens, index : Int32)
    if(!tokens[index] || tokens[index][:type] != expectedType)
     puts "error"
     {tokens[index], index + 1}
    else 
    {tokens[index], index + 1}
    end
end

alias AST_hash = Hash(String, String)
def parse(tokens) 
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
    end
  end
  return ast
end

puts parse(tokenize("printf('hi')"))