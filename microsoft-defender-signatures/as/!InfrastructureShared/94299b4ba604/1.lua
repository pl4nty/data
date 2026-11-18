-- Threat: !InfrastructureShared
-- Name: 94299b4ba604
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 200 then
  return mp.INFECTED
end
return mp.CLEAN
