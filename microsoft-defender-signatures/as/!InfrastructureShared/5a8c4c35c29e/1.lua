-- Threat: !InfrastructureShared
-- Name: 5a8c4c35c29e
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20971520 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
