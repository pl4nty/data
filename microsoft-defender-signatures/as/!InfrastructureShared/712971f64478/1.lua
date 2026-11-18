-- Threat: !InfrastructureShared
-- Name: 712971f64478
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
