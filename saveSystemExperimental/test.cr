alias Save_item = Hash(String, String|Int32)

puts "do you want to save or load? "
user_input = gets
if(user_input == "save") 
  saveName = "testSave"
  savedVars = Array(Save_item).new
  item = Save_item{"type" => "Int", "name" => "age", "value" => 20}
  savedVars << item
  content = prepareSave(saveName, savedVars)
  File.write(".localSave.txt", content)
else
  puts "error"
end

def prepareSave(saveName : String, vars)
  saveValue = "[#{saveName}]\n"
  vars.each do |var|
  saveValue += "#{var["name"]}:#{var["type"]}=#{var["value"]}"
  end
  return saveValue
end