-- Threat: !InfrastructureShared
-- Name: 2e786b6756dd
-- Type: 21

local l_0_0 = mp.getfilesize()
if 18000000 < l_0_0 and l_0_0 < 20000000 then
  return mp.LOWFI
end
return mp.CLEAN
