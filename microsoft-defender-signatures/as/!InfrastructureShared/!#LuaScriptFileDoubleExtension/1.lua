-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptFileDoubleExtension
-- Type: 12

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 8 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
if l_0_1 ~= ".exe" and l_0_1 ~= ".vbs" and l_0_1 ~= ".jar" then
  l_0_1 = string.sub(l_0_0, -3)
  if l_0_1 ~= ".js" then
    return mp.CLEAN
  end
end
if l_0_0:len() > 20 and string.sub(l_0_0, -16) == "_captions.mp3.js" then
  return mp.CLEAN
end
if l_0_0:len() > 15 and string.sub(l_0_0, -13) == ".html5.pdf.js" then
  return mp.CLEAN
end
local l_0_2 = {
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
  [".docx"] = "",
  [".xlsx"] = "",
  [".pptx"] = ""
}
local l_0_3 = string.sub(l_0_0, -7)
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".js" then
  mp.set_mpattribute("Lua:ContextJSDoubleExtension")
  mp.set_mpattribute("NScript:JSEnableEmulation")
end
l_0_3 = string.sub(l_0_0, -8)
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".vbs" then
  mp.set_mpattribute("Lua:ContextVBSDoubleExtension")
end
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".jar" then
  mp.set_mpattribute("Lua:ContextJARDoubleExtension")
end
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".exe" then
  mp.set_mpattribute("Lua:ContextEXEDoubleExtension")
end
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".js" then
  mp.set_mpattribute("Lua:ContextJSDoubleExtension")
  mp.set_mpattribute("NScript:JSEnableEmulation")
end
l_0_3 = string.sub(l_0_0, -9)
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".vbs" then
  mp.set_mpattribute("Lua:ContextVBSDoubleExtension")
end
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".jar" then
  mp.set_mpattribute("Lua:ContextJARDoubleExtension")
end
if l_0_2[string.sub(l_0_3, 1, 4)] and l_0_1 == ".exe" then
  mp.set_mpattribute("Lua:ContextEXEDoubleExtension")
end
return mp.CLEAN
