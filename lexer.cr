def tokenize(content)
  chars = content.split("")
  index = 0
  return_chars = [{type: "VOID", value: ""}]
  while index < content.size
    if(chars[index] === " ")

    elsif(/[a-zA-Z]/.match(chars[index]))
      string = chars[index]
      next_index = index + 1
      while next_index < chars.size && /[a-zA-Z]/.match(chars[next_index])
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

testRun(tokenize("let hi = sayhoi"))