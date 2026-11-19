-- Threat: !InfrastructureShared
-- Name: 3b29991b33b8
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
