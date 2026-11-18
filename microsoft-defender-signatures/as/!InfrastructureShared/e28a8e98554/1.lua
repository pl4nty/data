-- Threat: !InfrastructureShared
-- Name: e28a8e98554
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[EmbeddedEnc]") then
  return mp.INFECTED
end
return mp.CLEAN
