-- Threat: !InfrastructureShared
-- Name: 9c7804144ecf
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and (53248 <= l_0_0 and l_0_0 <= 61440 or 315392 <= l_0_0 and l_0_0 <= 327680) and (pehdr.NumberOfSections >= 2 or pehdr.NumberOfSections <= 4) then
  return mp.INFECTED
end
return mp.CLEAN
