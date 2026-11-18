-- Threat: !InfrastructureShared
-- Name: 3629af3f38cb
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
