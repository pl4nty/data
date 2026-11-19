-- Threat: !InfrastructureShared
-- Name: 372966567ab6
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
