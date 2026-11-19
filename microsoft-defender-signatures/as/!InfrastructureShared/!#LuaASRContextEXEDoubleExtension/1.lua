-- Threat: !InfrastructureShared
-- Name: !#Lua:ASRContextEXEDoubleExtension
-- Type: 12

if not mp.IsHipsRuleEnabled("fd960b4a-d8d7-4590-a6ce-0219df56a135") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:len() < 9 then
  return mp.CLEAN
end
local l_0_1 = {
  [".doc"] = "",
  [".xls"] = "",
  [".ppt"] = "",
  [".pdf"] = "",
  [".jpg"] = "",
  [".gif"] = "",
  [".png"] = "",
  [".pic"] = "",
  [".txt"] = "",
  [".mp3"] = "",
  ["\174cod"] = "",
  ["\174slx"] = "",
  ["\174tpp"] = "",
  ["\174fdp"] = "",
  ["\174gpj"] = "",
  ["\174fig"] = "",
  ["\174gnp"] = "",
  ["\174cip"] = "",
  ["\174txt"] = "",
  ["\1743pm"] = ""
}
local l_0_2 = {
  [".docx"] = "",
  [".xlsx"] = "",
  [".pptx"] = "",
  ["\174xcod"] = "",
  ["\174xlsx"] = "",
  ["\174xtpp"] = ""
}
local l_0_3 = string.sub(l_0_0, -8)
if l_0_1[string.sub(l_0_3, 1, 4)] and string.sub(l_0_3, -4) == ".exe" then
  mp.set_mpattribute("Lua:ASRContextEXEDoubleExtension")
end
l_0_3 = string.sub(l_0_0, -9)
if l_0_2[string.sub(l_0_3, 1, 5)] and string.sub(l_0_3, -4) == ".exe" then
  mp.set_mpattribute("Lua:ASRContextEXEDoubleExtension")
end
return mp.CLEAN
