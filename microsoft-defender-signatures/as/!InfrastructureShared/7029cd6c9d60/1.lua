-- Threat: !InfrastructureShared
-- Name: 7029cd6c9d60
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
