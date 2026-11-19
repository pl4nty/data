-- Threat: !InfrastructureShared
-- Name: e287a7917b0
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(EncScript)") then
  return mp.INFECTED
end
return mp.CLEAN
