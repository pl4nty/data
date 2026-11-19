-- Threat: !InfrastructureShared
-- Name: 4e29964686d8
-- Type: 21

if mp.get_mpattribute("//AGGR:OfficeFileOLE_1") then
  return mp.INFECTED
end
return mp.CLEAN
