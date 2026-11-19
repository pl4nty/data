-- Threat: !InfrastructureShared
-- Name: 3078699b40db
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3000000 or 7000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
