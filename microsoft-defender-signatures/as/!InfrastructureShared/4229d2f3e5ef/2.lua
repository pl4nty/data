-- Threat: !InfrastructureShared
-- Name: 4229d2f3e5ef
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
