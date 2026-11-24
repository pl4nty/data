-- Threat: !InfrastructureShared
-- Name: 30291aca1dc5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 100 then
  return mp.INFECTED
end
return mp.CLEAN
