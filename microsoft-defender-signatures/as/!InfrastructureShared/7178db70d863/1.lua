-- Threat: !InfrastructureShared
-- Name: 7178db70d863
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 78000000 or 96000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
