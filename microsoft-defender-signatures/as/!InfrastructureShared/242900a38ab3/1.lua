-- Threat: !InfrastructureShared
-- Name: 242900a38ab3
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
