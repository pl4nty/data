-- Threat: !InfrastructureShared
-- Name: 21540b9cc4906
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
