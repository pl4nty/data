-- Threat: !InfrastructureShared
-- Name: 41295b9c6bc3
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
