-- Threat: !InfrastructureShared
-- Name: 11541a4fa0ecd
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.lower(l_0_0.CompanyName) == "microsoft corporation" then
  return mp.INFECTED
end
if string.lower(l_0_0.CompanyName) == "adobe corporation" then
  return mp.INFECTED
end
if string.lower(l_0_0.CompanyName) == "pfu limited" then
  return mp.INFECTED
end
if string.lower(l_0_0.CompanyName) == " scriptlogic corporation" then
  return mp.INFECTED
end
return mp.CLEAN
