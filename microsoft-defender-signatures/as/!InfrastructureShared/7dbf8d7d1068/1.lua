-- Threat: !InfrastructureShared
-- Name: 7dbf8d7d1068
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 8192 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
