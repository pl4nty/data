-- Threat: !InfrastructureShared
-- Name: 71a784704cd5f
-- Type: 21

local l_0_0 = mp.getfilesize()
if 200000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
