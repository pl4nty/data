-- Threat: !InfrastructureShared
-- Name: 27785cea4dc6
-- Type: 21

local l_0_0 = mp.getfilesize()
if 40000 < l_0_0 or l_0_0 < 1000 then
  return mp.CLEAN
end
return mp.INFECTED
