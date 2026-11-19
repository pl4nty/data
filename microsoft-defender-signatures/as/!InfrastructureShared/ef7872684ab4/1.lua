-- Threat: !InfrastructureShared
-- Name: ef7872684ab4
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
