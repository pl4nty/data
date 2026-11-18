-- Threat: !InfrastructureShared
-- Name: 762987cf5fbc
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
