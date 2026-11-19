-- Threat: !InfrastructureShared
-- Name: 65784a6a22e9
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4000000 or 8000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
