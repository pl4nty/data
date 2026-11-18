-- Threat: !InfrastructureShared
-- Name: 13297ae600ef
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(SWC)") then
  return mp.INFECTED
end
return mp.CLEAN
