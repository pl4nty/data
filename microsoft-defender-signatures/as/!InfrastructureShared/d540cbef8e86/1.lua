-- Threat: !InfrastructureShared
-- Name: d540cbef8e86
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
