alias AST_hash = Hash(String, String | Int32 | Bool)

class Parser
  @tokens : Array(NamedTuple(type: String, value: String))
  @errLogger : ErrorLogger
  def initialize(tokens, errLogger)
    @tokens = tokens
    @index = 1
    @errLogger = errLogger
  end
  
  def parse
    ast = Array(AST_hash).new

    while @index < @tokens.size
      case @tokens[@index][:value]
  
      when "printf"
        eat("IDENTIFIER")
        eat("LPARA")
        used_value = eat("STRING")
        eat("RPARA")

        value_current = used_value[:value]
        ast_item = AST_hash{"type" => "printing", "value" => value_current}
        ast << ast_item
  
      when "Int"
        eat("IDENTIFIER")
        eat("COLON")
        name = eat("IDENTIFIER")
        eat("EQUALS")
        used_value = eat("NUM")

        varName = name[:value]
        value_current = used_value[:value]
        value_current = value_current.to_i

        if value_current.is_a?(Int32)
          ast_item = AST_hash{
            "type" => "variableDeclarationInt",
            "name" => varName,
            "value" => value_current
          }
          ast << ast_item
        else
          @errLogger.add_error(
            "ERROR, expected an intenger but got: #{typeof(value_current)}\nlunarMyth, parser index:#{@index}"
          )
        end

      when "readOutIntVar"
        eat("IDENTIFIER")
        eat("LPARA")
        variableData = eat("IDENTIFIER")
        eat("RPARA")

        variableName = variableData[:value]
        ast_item = AST_hash{"type" => "readIntVariable", "value" => variableName}
        ast << ast_item
  
      when "String"
        eat("IDENTIFIER")
        eat("COLON")
        name = eat("IDENTIFIER")
        eat("EQUALS")
        used_value = eat("STRING")
        varName = name[:value]
        value_current = used_value[:value]
        ast_item = AST_hash{
            "type" => "variableDeclarationString",
            "name" => varName,
            "value" => value_current
          }
        ast << ast_item
  
      when "readOutStringVar"
        eat("IDENTIFIER")
        eat("LPARA")
        variableData = eat("IDENTIFIER")
        eat("RPARA")

        variableName = variableData[:value]
        ast_item = AST_hash{"type" => "readStringVariable", "value" => variableName}
        ast << ast_item

      when "Boolean"
        eat("IDENTIFIER")
        eat("COLON")
        name = eat("IDENTIFIER")
        eat("EQUALS")
        used_value = eat("IDENTIFIER")
        varName = name[:value]
        value_current = (used_value[:value].downcase == "true")
        ast_item = AST_hash{
            "type" => "variableDeclarationBool",
            "name" => varName,
            "value" => value_current
          }
        ast << ast_item
  
      else
        @errLogger.add_error(
          "ERROR, #{@tokens[@index][:value]} was not found as a valid statement\nlunarMyth, parser index:#{@index}\n\n"
        )
        @index += 1
      end
    end

    return ast
  end

  def eat(expectedType)
    if !@tokens[@index] || @tokens[@index][:type] != expectedType
      @errLogger.add_error(
        "ERROR, expected type #{expectedType}\nlunarMyth, parser index:#{@index}"
      )
      @errLogger.error_log()
      exit(1)
    else
      token = @tokens[@index]
      @index += 1
      return token
    end
  end
end