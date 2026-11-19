-- Threat: !InfrastructureShared
-- Name: 7c78b2e187d4
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3072000 then
  return mp.INFECTED
end
return mp.CLEAN
