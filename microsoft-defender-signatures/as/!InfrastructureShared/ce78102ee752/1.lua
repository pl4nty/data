-- Threat: !InfrastructureShared
-- Name: ce78102ee752
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 393216 <= l_0_0 and l_0_0 <= 524288 and (pehdr.NumberOfSections >= 3 or pehdr.NumberOfSections <= 5) then
  return mp.INFECTED
end
return mp.CLEAN
