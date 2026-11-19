-- Threat: !InfrastructureShared
-- Name: 2d78412c70db
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
