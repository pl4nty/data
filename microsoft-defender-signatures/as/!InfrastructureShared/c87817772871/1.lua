-- Threat: !InfrastructureShared
-- Name: c87817772871
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
