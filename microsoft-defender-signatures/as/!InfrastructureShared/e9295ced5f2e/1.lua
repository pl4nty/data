-- Threat: !InfrastructureShared
-- Name: e9295ced5f2e
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3500 then
  return mp.INFECTED
end
return mp.CLEAN
