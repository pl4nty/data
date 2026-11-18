-- Threat: !InfrastructureShared
-- Name: 288cb976281d
-- Type: 21

local l_0_0 = mp.getfilesize()
if 614400 < l_0_0 and l_0_0 < 716800 and mp.get_mpattribute("elfa_isstripped") then
  return mp.INFECTED
end
return mp.CLEAN
