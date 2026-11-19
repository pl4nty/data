-- Threat: !InfrastructureShared
-- Name: bb787d3f4ea2
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and 210000 < l_0_0 and l_0_0 < 250000 and pehdr.NumberOfSections == 4 and pesecs[4].Name == ".crt1" then
  return mp.INFECTED
end
return mp.CLEAN
