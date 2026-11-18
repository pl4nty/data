-- Threat: !InfrastructureShared
-- Name: 1c578489e9824
-- Type: 21

local l_0_0 = mp.getfilesize()
if 250000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
