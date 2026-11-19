-- Threat: !InfrastructureShared
-- Name: 7e781b0c1980
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 30000 or 150000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
