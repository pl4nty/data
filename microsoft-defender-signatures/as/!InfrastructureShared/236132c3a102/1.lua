-- Threat: !InfrastructureShared
-- Name: 236132c3a102
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 159744 and pehdr.NumberOfSections == 9 and pesecs[6].Name == "CONST" then
  return mp.INFECTED
end
return mp.CLEAN
