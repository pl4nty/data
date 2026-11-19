-- Threat: !InfrastructureShared
-- Name: 10c297c95f961
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
