-- Threat: !InfrastructureShared
-- Name: 8378021b59cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 106496 <= l_0_0 and l_0_0 <= 110592 and (pehdr.NumberOfSections >= 4 or pehdr.NumberOfSections <= 6) then
  return mp.INFECTED
end
return mp.CLEAN
