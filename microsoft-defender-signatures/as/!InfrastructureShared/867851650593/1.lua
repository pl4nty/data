-- Threat: !InfrastructureShared
-- Name: 867851650593
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and l_0_0 < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
