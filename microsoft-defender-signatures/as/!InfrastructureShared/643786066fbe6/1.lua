-- Threat: !InfrastructureShared
-- Name: 643786066fbe6
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
