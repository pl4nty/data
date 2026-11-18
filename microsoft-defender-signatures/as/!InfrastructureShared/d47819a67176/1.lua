-- Threat: !InfrastructureShared
-- Name: d47819a67176
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 50000 or 150000 < l_0_0 and l_0_0 < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
