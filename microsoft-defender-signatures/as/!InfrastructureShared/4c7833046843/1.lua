-- Threat: !InfrastructureShared
-- Name: 4c7833046843
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 10485760 < l_0_0 or l_0_0 < 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
