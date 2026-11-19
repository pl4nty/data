-- Threat: !InfrastructureShared
-- Name: b18cd6fd48d7
-- Type: 21

local l_0_0 = mp.getfilesize()
if 200000 < l_0_0 or l_0_0 < 5000 then
  return mp.CLEAN
end
return mp.INFECTED
