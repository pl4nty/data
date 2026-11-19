-- Threat: !InfrastructureShared
-- Name: 2f786a17fae5
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 90112 then
  return mp.INFECTED
end
return mp.CLEAN
