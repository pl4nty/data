-- Threat: !InfrastructureShared
-- Name: 4e294bc4ca29
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
