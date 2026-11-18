-- Threat: !InfrastructureShared
-- Name: !#Lua:SourceCodeFileExtension
-- Type: 13

local l_0_0 = mp.enum_mpattributesubstring("SCPT:CodeOnly")
if #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = {
  [".asm"] = "",
  [".asm64"] = "",
  [".c"] = "",
  [".cpp"] = "",
  [".cxx"] = "",
  [".h"] = "",
  [".m"] = ""
}
local l_0_2 = {
  [".java"] = "",
  [".cs"] = "",
  [".lua"] = "",
  [".go"] = ""
}
local l_0_3 = {
  [".py"] = "",
  [".pyc"] = "",
  [".ps1"] = "",
  [".pl"] = "",
  [".rb"] = "",
  [".bat"] = "",
  [".sh"] = "",
  [".vba"] = "",
  [".vbs"] = "",
  [".vb"] = "",
  [".hta"] = ""
}
local l_0_4 = {
  [".js"] = "",
  [".html"] = "",
  [".htm"] = "",
  [".aspx"] = "",
  [".php"] = "",
  [".cgi"] = "",
  [".jsp"] = "",
  [".wasm"] = "",
  [".wat"] = ""
}
local l_0_5 = {
  [".md"] = "",
  [".txt"] = "",
  [".bin"] = ""
}
local l_0_6 = string.sub(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), -5):match("(%.%w+)$")
if l_0_1[l_0_6] then
  mp.set_mpattribute("Lua:CppLangFileExtension")
  return mp.INFECTED
end
if l_0_2[l_0_6] then
  mp.set_mpattribute("Lua:ProgrammingLangFileExtension")
  return mp.INFECTED
end
if l_0_3[l_0_6] then
  mp.set_mpattribute("Lua:ScriptFileExtension")
  return mp.INFECTED
end
if l_0_4[l_0_6] then
  mp.set_mpattribute("Lua:WebFileExtension")
  return mp.INFECTED
end
if l_0_5[l_0_6] then
  mp.set_mpattribute("Lua:ProgrammingRelatedFileExtension")
  return mp.INFECTED
end
return mp.CLEAN
