-- Threat: !InfrastructureShared
-- Name: 8a296f0f61b1
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 500 then
  return mp.INFECTED
end
return mp.CLEAN
