-- Threat: !InfrastructureShared
-- Name: 462920927d84
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
