-- Threat: !InfrastructureShared
-- Name: 427891adccbc
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
