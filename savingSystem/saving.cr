class Saving


  # HELPER FUNCTIONS
  def prepareSave(saveName : String, vars)
    saveValue = "[#{saveName}]\n"
    vars.each do |var|
      saveValue += "#{var["name"]}:#{var["type"]}=#{var["value"]}\n|{l&l}|\n"
    end
    return saveValue
  end

  def saveInt(name : String, value : Int32)
    item = Save_item{"type" => "Int", "name" => name, "value" => value}
  end

  def saveString(name : String, value : String)
    item = Save_item{"type" => "String", "name" => name, "value" => value}
  end
end