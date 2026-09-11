def eat(expectedType, tokens, index : Int32)
    if(!tokens[index] || tokens[index][:type] != expectedType)
     puts "error"
     {tokens[index], index + 1}
    else 
    {tokens[index], index + 1}
    end
end