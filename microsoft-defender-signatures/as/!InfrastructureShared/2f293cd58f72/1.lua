-- Threat: !InfrastructureShared
-- Name: 2f293cd58f72
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
