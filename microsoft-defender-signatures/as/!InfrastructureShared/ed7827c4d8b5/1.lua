-- Threat: !InfrastructureShared
-- Name: ed7827c4d8b5
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0.ProductName, "AUTORUN", 1, true) == nil or string.find(l_0_0.FileDescription, "AUTORUN", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
