-- Threat: !InfrastructureShared
-- Name: 888cb673dbf4
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and l_0_0 < 16384 then
  return mp.INFECTED
end
return mp.CLEAN
