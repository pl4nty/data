-- Threat: !InfrastructureShared
-- Name: 3c29bf6aba29
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
