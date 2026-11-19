-- Threat: !InfrastructureShared
-- Name: 6d783c930afe
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 77824 <= l_0_0 and l_0_0 <= 86016 and (pehdr.NumberOfSections >= 5 or pehdr.NumberOfSections <= 7) then
  return mp.INFECTED
end
return mp.CLEAN
