-- Threat: !InfrastructureShared
-- Name: !#MSIEmbeddedFileChecks
-- Type: 11
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.enum_mpattributesubstring("//Lua:MSIBinary:")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = #l_0_0
if 10 <= l_0_1 then
  mp.set_mpattribute("//Lua:MSIBinCount:GE10")
elseif 5 <= l_0_1 then
  mp.set_mpattribute("//Lua:MSIBinCount:GE5")
elseif 3 <= l_0_1 then
  mp.set_mpattribute("//Lua:MSIBinCount:GE3")
elseif 2 <= l_0_1 then
  mp.set_mpattribute("//Lua:MSIBinCount:GE2")
else
  mp.set_mpattribute("//Lua:MSIBinCount:GE1")
end
return mp.CLEAN
