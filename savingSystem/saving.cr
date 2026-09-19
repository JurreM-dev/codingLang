alias Save_item = Hash(String, String|Int32)
class Saving
  # SAVING 
  def saveInt(saveKey : String, variable : Int, variableName : String)
    item = prepSaveInt(variableName, variable)
    content = prepareSave(saveKey, item)
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