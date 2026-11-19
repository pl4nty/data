-- Threat: !InfrastructureShared
-- Name: b1298dba3313
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
