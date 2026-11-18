-- Threat: !InfrastructureShared
-- Name: 8229b44ff471
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
