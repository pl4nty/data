-- Threat: !InfrastructureShared
-- Name: 2a78b182c720
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 124160 and pehdr.NumberOfSections == 5 and pesecs[4].Name == ".zdata" then
  return mp.INFECTED
end
return mp.CLEAN
