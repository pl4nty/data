-- Threat: !InfrastructureShared
-- Name: c678fdf10e1b
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 196608 <= l_0_0 and l_0_0 <= 217088 and (pehdr.NumberOfSections >= 5 or pehdr.NumberOfSections <= 7) then
  return mp.INFECTED
end
return mp.CLEAN
