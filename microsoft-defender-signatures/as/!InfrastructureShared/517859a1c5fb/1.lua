-- Threat: !InfrastructureShared
-- Name: 517859a1c5fb
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 196608 then
  return mp.INFECTED
end
return mp.CLEAN
