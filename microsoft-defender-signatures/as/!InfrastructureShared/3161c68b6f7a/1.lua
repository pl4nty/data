-- Threat: !InfrastructureShared
-- Name: 3161c68b6f7a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 102400 <= l_0_0 and l_0_0 <= 143360 and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
