-- Threat: !InfrastructureShared
-- Name: 23290d8c6ed0
-- Type: 21

local l_0_0 = mp.getfilesize()
if 100 <= l_0_0 then
  return mp.CLEAN
end
return mp.LOWFI
