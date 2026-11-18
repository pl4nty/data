-- Threat: !InfrastructureShared
-- Name: 732920007006
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
