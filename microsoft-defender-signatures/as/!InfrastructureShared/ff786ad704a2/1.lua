-- Threat: !InfrastructureShared
-- Name: ff786ad704a2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 900000 < l_0_0 and l_0_0 < 1300000 then
  return mp.INFECTED
end
return mp.CLEAN
