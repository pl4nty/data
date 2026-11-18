-- Threat: !InfrastructureShared
-- Name: e978b00200d1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20971520 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
