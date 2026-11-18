-- Threat: !InfrastructureShared
-- Name: 53292128809b
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
