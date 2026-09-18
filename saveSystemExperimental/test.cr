alias Save_item = Hash(String, String|Int32)

puts "do you want to save or load? "
user_input = gets
if(user_input == "save") 
  saveName = "testSave"
  savedVars = Array(Save_item).new
  item = saveInt("testr", 42)
  item2 = saveString("name", "john")
  savedVars << item
  savedVars << item2
  content = prepareSave(saveName, savedVars)
  File.write(".localSave.txt", content)
elsif(user_input == "load") 
  if File.exists?(".localSave.txt")
    fileContent = File.read(".localSave.txt")
    fileComponents = fileContent.split(/[\[\]]/)
    fileComponents.shift
    puts fileComponents
    puts fileComponents.size
  else
    puts "error"
  end
else
  puts "error"
end

def prepareSave(saveName : String, vars)
  saveValue = "[#{saveName}]\n"
  vars.each do |var|
  saveValue += "#{var["name"]}:#{var["type"]}=#{var["value"]}\n"
  end
  return saveValue
end

def saveInt(name : String, value : Int32)
  item = Save_item{"type" => "Int", "name" => name, "value" => value}
end

def saveString(name : String, value : String)
  item = Save_item{"type" => "String", "name" => name, "value" => value}
end