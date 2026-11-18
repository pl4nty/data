-- Threat: !InfrastructureShared
-- Name: 5029a887d8dd
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
