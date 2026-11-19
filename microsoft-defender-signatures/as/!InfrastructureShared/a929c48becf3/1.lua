-- Threat: !InfrastructureShared
-- Name: a929c48becf3
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
