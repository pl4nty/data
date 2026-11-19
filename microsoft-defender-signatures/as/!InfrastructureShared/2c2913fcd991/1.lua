-- Threat: !InfrastructureShared
-- Name: 2c2913fcd991
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
