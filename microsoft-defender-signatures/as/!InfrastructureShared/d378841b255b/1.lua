-- Threat: !InfrastructureShared
-- Name: d378841b255b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 774000 <= l_0_0 and l_0_0 <= 800000 and pehdr.NumberOfSections <= 9 and pesecs[2].Name == ".itext" then
  return mp.INFECTED
end
return mp.CLEAN
