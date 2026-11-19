-- Threat: !InfrastructureShared
-- Name: 9f788432198f
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
