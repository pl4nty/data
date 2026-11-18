-- Threat: !InfrastructureShared
-- Name: 1bc8cbd47c888
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
