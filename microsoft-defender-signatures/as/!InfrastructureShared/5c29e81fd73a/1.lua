-- Threat: !InfrastructureShared
-- Name: 5c29e81fd73a
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
