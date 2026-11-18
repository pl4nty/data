-- Threat: !InfrastructureShared
-- Name: 4529d9ce5976
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
