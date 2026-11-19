-- Threat: !InfrastructureShared
-- Name: 4829fd1c66d0
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
