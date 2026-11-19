-- Threat: !InfrastructureShared
-- Name: 5a29dfb79c74
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
