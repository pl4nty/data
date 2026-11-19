-- Threat: !InfrastructureShared
-- Name: 2e2965508e08
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000 then
  return mp.INFECTED
end
return mp.CLEAN
