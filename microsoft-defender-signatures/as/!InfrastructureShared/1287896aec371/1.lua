-- Threat: !InfrastructureShared
-- Name: 1287896aec371
-- Type: 21

local l_0_0 = mp.getfilesize()
if 118784 <= l_0_0 and l_0_0 <= 122880 and pehdr.NumberOfSections == 6 and pesecs[4].Name == ".crt1" then
  return mp.INFECTED
end
return mp.CLEAN
