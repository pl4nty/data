-- Threat: !InfrastructureShared
-- Name: 5b78d93c1cb6
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0.CompanyName, "LaplFink Software", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
