-- Threat: !InfrastructureShared
-- Name: e4783b3f2db4
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 1000 then
  return mp.CLEAN
end
return mp.INFECTED
