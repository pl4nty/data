-- Threat: !InfrastructureShared
-- Name: 4f297772dfa3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
