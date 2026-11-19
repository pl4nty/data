-- Threat: !InfrastructureShared
-- Name: 9e8c817d7552
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
