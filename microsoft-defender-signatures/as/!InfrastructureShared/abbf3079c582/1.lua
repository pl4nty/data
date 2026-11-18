-- Threat: !InfrastructureShared
-- Name: abbf3079c582
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3000 < l_0_0 and l_0_0 < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
