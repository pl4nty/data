-- Threat: !InfrastructureShared
-- Name: 3e29c5f7203a
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 256 then
  return mp.INFECTED
end
return mp.CLEAN
