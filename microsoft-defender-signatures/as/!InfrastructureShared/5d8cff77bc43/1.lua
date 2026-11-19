-- Threat: !InfrastructureShared
-- Name: 5d8cff77bc43
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20971520 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
