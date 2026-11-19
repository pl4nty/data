-- Threat: !InfrastructureShared
-- Name: 3178e0e4de8e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 204800 <= l_0_0 and l_0_0 <= 212992 and (pehdr.NumberOfSections >= 4 or pehdr.NumberOfSections <= 5) then
  return mp.INFECTED
end
return mp.CLEAN
