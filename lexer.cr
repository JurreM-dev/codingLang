def tokenize(content)
  chars = content.split("")
  index = 0
  return_chars = [{type: "void", value: ""}]
  while index < content.size
    if(chars[index] === " ")

    elsif(chars[index] === "=")
      return_chars.push({
        type: "EQUALS",
        value: "="
      })
    end
  index += 1
  end
  puts return_chars
end

tokenize("== =    =")