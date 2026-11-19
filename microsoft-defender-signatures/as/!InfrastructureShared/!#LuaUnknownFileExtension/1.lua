-- Threat: !InfrastructureShared
-- Name: !#Lua:UnknownFileExtension
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename():lower()
local l_0_1 = l_0_0:match("(%.[^.]+)$")
l_0_1 = l_0_1 == nil and "" or l_0_1
local l_0_2 = 0
if l_0_1 ~= "" and mp.GetExtensionClass(l_0_1) == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
