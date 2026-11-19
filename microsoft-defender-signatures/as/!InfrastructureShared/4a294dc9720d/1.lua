-- Threat: !InfrastructureShared
-- Name: 4a294dc9720d
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
