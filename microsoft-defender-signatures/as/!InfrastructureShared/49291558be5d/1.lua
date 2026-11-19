-- Threat: !InfrastructureShared
-- Name: 49291558be5d
-- Type: 21

if mp.get_mpattribute("//AGGR:OfficeFile") then
  return mp.INFECTED
end
return mp.CLEAN
