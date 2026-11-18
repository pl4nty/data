-- Threat: !InfrastructureShared
-- Name: 68780e5aecb3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 153600 then
  return mp.INFECTED
end
return mp.CLEAN
