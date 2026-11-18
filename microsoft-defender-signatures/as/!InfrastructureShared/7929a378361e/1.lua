-- Threat: !InfrastructureShared
-- Name: 7929a378361e
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4000 then
  return mp.INFECTED
end
return mp.CLEAN
