-- Threat: !InfrastructureShared
-- Name: ba29fda49f89
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
