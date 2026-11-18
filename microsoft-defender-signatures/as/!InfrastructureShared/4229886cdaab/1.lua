-- Threat: !InfrastructureShared
-- Name: 4229886cdaab
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
