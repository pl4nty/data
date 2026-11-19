-- Threat: !InfrastructureShared
-- Name: 36a918fcb13f
-- Type: 21

local l_0_0 = nri.GetConnectionString()
if l_0_0:find("DestPort=3389;", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
