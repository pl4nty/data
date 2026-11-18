-- Threat: !InfrastructureShared
-- Name: 21f786f2556d8
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
