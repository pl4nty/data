-- Threat: !InfrastructureShared
-- Name: 5e78e166bf00
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1500000 <= l_0_0 and l_0_0 <= 2000000 and pesecs[1].Name == "UPX0" or 3300000 <= l_0_0 and l_0_0 <= 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
