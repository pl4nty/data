-- Threat: !InfrastructureShared
-- Name: 3429bf758c47
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
