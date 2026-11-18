-- Threat: !InfrastructureShared
-- Name: 3c78462146e1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 150000 < l_0_0 or l_0_0 < 1000 then
  return mp.CLEAN
end
return mp.INFECTED
