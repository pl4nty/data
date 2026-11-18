-- Threat: !InfrastructureShared
-- Name: 22299fae0dd1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20000 < l_0_0 and l_0_0 < 31000 then
  return mp.INFECTED
end
return mp.CLEAN
