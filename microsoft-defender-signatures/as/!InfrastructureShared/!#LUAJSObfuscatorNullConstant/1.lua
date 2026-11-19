-- Threat: !InfrastructureShared
-- Name: !#LUA:JS/Obfuscator.Null.Constant
-- Type: 13

local l_0_0
if mp.get_mpattribute("SCPT:JS/Obfuscator.ShellExecute.Cmd") then
  l_0_0 = 1
elseif mp.get_mpattribute("SCPT:JS/Obfuscator.Null.Constant") then
  l_0_0 = 2
else
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 < 2000 or 30000 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
local l_0_3, l_0_4
if l_0_0 == 1 then
  l_0_3, l_0_3, l_0_4 = string.find(l_0_2, "(%^.-\",)")
elseif l_0_0 == 2 then
  l_0_3, l_0_3, l_0_4 = string.find(l_0_2, "(%=%'%^.-%)%;\\\"\"%;)")
else
  return mp.CLEAN
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5
if l_0_0 == 1 then
  l_0_3, l_0_5 = string.gsub(l_0_4, "%^", "", 25)
elseif l_0_0 == 2 then
  l_0_3, l_0_5 = string.gsub(l_0_4, "%=%'%^", "", 25)
else
  return mp.CLEAN
end
if l_0_5 < 25 then
  return mp.CLEAN
end
mp.set_mpattribute("//LUA:JS/Obfuscator.Equal.Apostrophe.Caret")
return mp.CLEAN
