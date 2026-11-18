-- Threat: !InfrastructureShared
-- Name: 512910dca0a9
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
