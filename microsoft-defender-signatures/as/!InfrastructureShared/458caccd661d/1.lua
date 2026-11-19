-- Threat: !InfrastructureShared
-- Name: 458caccd661d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3145728 <= l_0_0 and l_0_0 <= 20971520 then
  return mp.INFECTED
end
return mp.CLEAN
