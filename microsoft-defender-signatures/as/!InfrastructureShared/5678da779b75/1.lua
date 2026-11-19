-- Threat: !InfrastructureShared
-- Name: 5678da779b75
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 36864 then
  return mp.INFECTED
end
return mp.CLEAN
