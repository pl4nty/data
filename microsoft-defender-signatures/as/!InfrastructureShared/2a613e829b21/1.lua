-- Threat: !InfrastructureShared
-- Name: 2a613e829b21
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and pehdr.NumberOfSections == 5 and 1785856 <= l_0_0 and l_0_0 <= 1802240 then
  return mp.INFECTED
end
return mp.CLEAN
