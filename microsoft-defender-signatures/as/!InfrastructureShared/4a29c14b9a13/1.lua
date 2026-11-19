-- Threat: !InfrastructureShared
-- Name: 4a29c14b9a13
-- Type: 21

if mp.get_mpattribute("//AGGR:OfficeFile") then
  return mp.INFECTED
end
return mp.CLEAN
