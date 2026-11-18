-- Threat: !InfrastructureShared
-- Name: 4f29eb9282ef
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
