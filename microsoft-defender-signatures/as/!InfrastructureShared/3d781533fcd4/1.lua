-- Threat: !InfrastructureShared
-- Name: 3d781533fcd4
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("HSTR:GolangBinary") and l_0_0 < 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
