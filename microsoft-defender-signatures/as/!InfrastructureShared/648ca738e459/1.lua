-- Threat: !InfrastructureShared
-- Name: 648ca738e459
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2500 then
  return mp.INFECTED
end
return mp.CLEAN
