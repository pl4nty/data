-- Threat: !InfrastructureShared
-- Name: 40782d1b9702
-- Type: 21

local l_0_0 = mp.getfilesize()
if 32768 <= l_0_0 and l_0_0 <= 720896 and pesecs[4].Name == ".text" and pesecs[1].Name == ".text" then
  return mp.INFECTED
end
return mp.CLEAN
