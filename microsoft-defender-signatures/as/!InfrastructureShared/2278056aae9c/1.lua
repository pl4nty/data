-- Threat: !InfrastructureShared
-- Name: 2278056aae9c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 770048 <= l_0_0 and l_0_0 <= 1138688 and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
