-- Threat: !InfrastructureShared
-- Name: 11878e0ffbeb1
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
