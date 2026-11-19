-- Threat: !InfrastructureShared
-- Name: 4b29910e3be5
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
