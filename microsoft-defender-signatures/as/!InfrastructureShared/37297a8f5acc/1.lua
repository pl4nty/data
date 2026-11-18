-- Threat: !InfrastructureShared
-- Name: 37297a8f5acc
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
