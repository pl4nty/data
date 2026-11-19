-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptFileInTempLow
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:len() < 24 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:len() > 20 and l_0_2:len() > 3 and string.sub(l_0_1, -10) == "\\temp\\low\\" then
  if string.sub(l_0_2, -3) == ".js" then
    mp.set_mpattribute("Lua:ContextJSFileInTempLow")
  elseif string.sub(l_0_2, -4) == ".vbs" then
    mp.set_mpattribute("Lua:ContextVBSFileInTempLow")
  end
end
return mp.CLEAN
