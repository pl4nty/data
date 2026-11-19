-- Threat: !InfrastructureShared
-- Name: 447840b44a5d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 8000000 or 11000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
