def tokenize(content)
  chars = content.split("")
  index = 0
  return_chars = [{type: "VOID", value: ""}]
  while index < content.size
    if(chars[index] === " ")

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
    elsif(chars[index] === "=")
      return_chars.push({
        type: "EQUALS",
        value: "="
      })
    elsif(chars[index] === "'") 
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

def testRun(chars)
  i = 1
  while i < chars.size 
    puts chars[i]
    i += 1
  end
end

testRun(tokenize("let hi = 'sayhoi' 999999 6 'yoski' hoi ="))