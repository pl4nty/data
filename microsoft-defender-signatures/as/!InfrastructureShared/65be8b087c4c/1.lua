-- Threat: !InfrastructureShared
-- Name: 65be8b087c4c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
