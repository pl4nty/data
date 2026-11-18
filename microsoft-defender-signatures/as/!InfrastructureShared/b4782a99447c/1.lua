-- Threat: !InfrastructureShared
-- Name: b4782a99447c
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
