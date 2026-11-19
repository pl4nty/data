-- Threat: !InfrastructureShared
-- Name: 3f615f2392cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 184000 < l_0_0 and l_0_0 < 185000 then
  return mp.INFECTED
end
return mp.CLEAN
