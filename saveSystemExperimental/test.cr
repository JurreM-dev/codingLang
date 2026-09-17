puts "do you want to save or load? "
user_input = gets
if(user_input == "save") 
  saveName = "testSave"
  savedVars = ["name = jeff", "age = 20"]
  content = prepareSave(saveName, savedVars)
  File.write(".localSave.txt", content)
else
  puts "error"
end

def prepareSave(saveName : String, vars)
  saveValue = "[#{saveName}]\n"
  vars.each do |var|
    saveValue += var + "\n"
  end
  return saveValue
end