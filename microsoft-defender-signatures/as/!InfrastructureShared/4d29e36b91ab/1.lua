-- Threat: !InfrastructureShared
-- Name: 4d29e36b91ab
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
