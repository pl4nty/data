-- Threat: !InfrastructureShared
-- Name: 9540496a3ccf
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
