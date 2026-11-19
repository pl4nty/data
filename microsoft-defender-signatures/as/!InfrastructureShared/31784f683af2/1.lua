-- Threat: !InfrastructureShared
-- Name: 31784f683af2
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
