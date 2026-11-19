-- Threat: !InfrastructureShared
-- Name: 4629656f3bf1
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
