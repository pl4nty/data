-- Threat: !InfrastructureShared
-- Name: 3c29f08271c5
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
