-- Threat: !InfrastructureShared
-- Name: aa78c0f830dd
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 8000000 or 10000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
