-- Threat: !InfrastructureShared
-- Name: 4578a196b58c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 100000 or 300000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
