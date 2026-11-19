-- Threat: !InfrastructureShared
-- Name: 7d29ed3b08db
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
