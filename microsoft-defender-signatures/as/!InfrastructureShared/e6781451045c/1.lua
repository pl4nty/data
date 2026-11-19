-- Threat: !InfrastructureShared
-- Name: e6781451045c
-- Type: 21

local l_0_0 = mp.getfilesize()
if 80000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
