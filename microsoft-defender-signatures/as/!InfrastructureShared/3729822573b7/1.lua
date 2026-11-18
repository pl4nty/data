-- Threat: !InfrastructureShared
-- Name: 3729822573b7
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
