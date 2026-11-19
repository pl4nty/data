-- Threat: !InfrastructureShared
-- Name: 5d29ece299e8
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
