-- Threat: !InfrastructureShared
-- Name: 2778f28a301b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 409600 < l_0_0 and l_0_0 < 716800 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
