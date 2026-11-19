-- Threat: !InfrastructureShared
-- Name: 5e8c8e169f3a
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
