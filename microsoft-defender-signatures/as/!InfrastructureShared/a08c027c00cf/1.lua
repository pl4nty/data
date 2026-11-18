-- Threat: !InfrastructureShared
-- Name: a08c027c00cf
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20971520 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
