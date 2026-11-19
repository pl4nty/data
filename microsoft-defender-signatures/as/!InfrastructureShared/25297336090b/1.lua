-- Threat: !InfrastructureShared
-- Name: 25297336090b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 4200 then
  return mp.INFECTED
end
return mp.CLEAN
