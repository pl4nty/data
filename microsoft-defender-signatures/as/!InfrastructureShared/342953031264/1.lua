-- Threat: !InfrastructureShared
-- Name: 342953031264
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
