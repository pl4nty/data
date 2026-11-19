-- Threat: !InfrastructureShared
-- Name: 5978ae3576b6
-- Type: 21

local l_0_0 = mp.getfilesize()
if 144000 < l_0_0 and l_0_0 < 154000 then
  return mp.INFECTED
end
return mp.CLEAN
