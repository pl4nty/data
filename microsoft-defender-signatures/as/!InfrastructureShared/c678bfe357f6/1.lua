-- Threat: !InfrastructureShared
-- Name: c678bfe357f6
-- Type: 21

local l_0_0 = mp.getfilesize()
if 130000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
