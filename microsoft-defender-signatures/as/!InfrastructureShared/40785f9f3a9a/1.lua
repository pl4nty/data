-- Threat: !InfrastructureShared
-- Name: 40785f9f3a9a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and 190000 < l_0_0 and l_0_0 < 230000 and pehdr.NumberOfSections == 4 and pesecs[4].Name == ".crt2" then
  return mp.INFECTED
end
return mp.CLEAN
