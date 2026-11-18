-- Threat: !InfrastructureShared
-- Name: 7f78ddcd3cc6
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 36864 <= l_0_0 and l_0_0 <= 40960 and (pehdr.NumberOfSections >= 4 or pehdr.NumberOfSections <= 6) then
  return mp.INFECTED
end
return mp.CLEAN
