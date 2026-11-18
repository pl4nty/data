-- Threat: !InfrastructureShared
-- Name: 1a3789b5f5749
-- Type: 21

local l_0_0 = mp.getfilesize()
if 400000 < l_0_0 or l_0_0 < 5000 then
  return mp.CLEAN
end
return mp.INFECTED
