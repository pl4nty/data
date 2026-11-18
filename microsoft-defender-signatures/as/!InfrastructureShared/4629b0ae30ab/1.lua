-- Threat: !InfrastructureShared
-- Name: 4629b0ae30ab
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
