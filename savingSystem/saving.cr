alias Save_item = Hash(String, String|Int32)
class Saving
  @errLogger : ErrorLogger
  def initialize(errLogger)
    @errLogger = errLogger
  end
  # SAVING 
  def saveInt(saveKey : String, variableName : String, variable : Int32)
    item = prepSaveInt(variableName, variable)
    content = prepareSave(saveKey, item)
    if(File.exists?(".localSave.txt"))
      fileContent = File.read(".localSave.txt")
      fileComponents = fileContent.split(/[\[\]]/)
      fileComponents.shift
      targetName = saveKey
      cursor = 0
      newWrite = ""
      saveExists = false
      while cursor < fileComponents.size
        nameFound = fileComponents[cursor].strip
        if(nameFound == targetName)
          newWrite += content
          saveExists = true
          cursor += 2
        else
          newWrite += "[#{nameFound}]"
          cursor += 1
          newWrite += fileComponents[cursor]
          cursor += 1
        end
      end
      if(!saveExists) 
        newWrite += content
      end
      File.write(".localSave.txt", newWrite)
    else
      File.write(".localSave.txt", content)
    end
  end

    def loadInt(saveKey : String) 
      if(!File.exists?(".localSave.txt"))
        @errLogger.fatalErr("error, file used for saving doesn't exist, could not load save")
      end
      fileContent = File.read(".localSave.txt")
      fileComponents = fileContent.split(/[\[\]]/)
      fileComponents.shift
      targetName = saveKey
      cursor = 0
      saveExists = false

      foundSave = 0
      while cursor < fileComponents.size
        nameFound = fileComponents[cursor].strip
        if(nameFound == targetName)
          saveExists = true
          cursor += 1
          valueFound = fileComponents[cursor]
          break
        else
          cursor += 2
        end
      end
      if(!saveExists) 
        foundSave = 0
      end
      return foundSave
    end


  # HELPER FUNCTIONS
  def prepareSave(saveName : String, var)
    saveValue = "[#{saveName}]\n"
    saveValue += "#{var["name"]}:#{var["type"]}=#{var["value"]}\n"
    return saveValue
  end

  def prepSaveInt(name : String, value : Int32)
    item = Save_item{"type" => "Int", "name" => name, "value" => value}
  end

  def prepSaveString(name : String, value : String)
    item = Save_item{"type" => "String", "name" => name, "value" => value}
  end
end