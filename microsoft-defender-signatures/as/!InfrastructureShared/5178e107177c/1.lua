-- Threat: !InfrastructureShared
-- Name: 5178e107177c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and l_0_0 <= 3072000 and pesecs[1].Name == "UPX0" then
  return mp.INFECTED
end
return mp.CLEAN
