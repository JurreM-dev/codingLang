alias Save_item = Hash(String, String|Int32)
class Saving
  # SAVING 
  def saveInt(saveKey : String, variable : Int, variableName : String)
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

    def loadInt(saveKey : String) 
      if(!File.exists?(".localSave.txt"))
        puts "error, file used for saving doesn't exist, could not load save"
        exit(1)
      end
      fileContent = File.read(".localSave.txt")
      fileComponents = fileContent.split(/[\[\]]/)
      fileComponents.shift
      targetName = saveKey
      cursor = 0
      saveExists = false
    end
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