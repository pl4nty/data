-- Threat: !InfrastructureShared
-- Name: b540d6be5524
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
