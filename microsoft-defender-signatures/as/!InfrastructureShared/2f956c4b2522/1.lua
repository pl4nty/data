-- Threat: !InfrastructureShared
-- Name: 2f956c4b2522
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[ExportEP]") then
  return mp.INFECTED
end
return mp.CLEAN
