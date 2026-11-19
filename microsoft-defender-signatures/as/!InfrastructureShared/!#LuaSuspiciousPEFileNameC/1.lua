-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousPEFileName.C
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2:len()
if 14 < l_0_3 and l_0_3 < 40 and l_0_2:find("^track_%d+%.exe") == 1 then
  mp.set_mpattribute("Lua:SuspiciousPEFileName.C")
end
return mp.CLEAN
