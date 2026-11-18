-- Threat: !InfrastructureShared
-- Name: 83783eb6c465
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 147456 <= l_0_0 and l_0_0 <= 155648 and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
