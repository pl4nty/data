-- Threat: !InfrastructureShared
-- Name: 7361b499bf7b
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0.InternalName == "mimikatz" or string.find(l_0_0.CompanyName, "gentilkiwi", 1, true) ~= nil or l_0_0.ProductName == "mimikatz" or string.find(l_0_0.SpecialBuild, "kiwi flavor", 1, true) ~= nil
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
