-- Threat: !InfrastructureShared
-- Name: 587862c79ad0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 12000 <= l_0_0 and l_0_0 <= 17096 and mp.get_mpattribute("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
