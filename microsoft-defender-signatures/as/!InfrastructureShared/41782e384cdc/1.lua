-- Threat: !InfrastructureShared
-- Name: 41782e384cdc
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000 or 30000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
