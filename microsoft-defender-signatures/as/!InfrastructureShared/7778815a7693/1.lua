-- Threat: !InfrastructureShared
-- Name: 7778815a7693
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 196608 then
  return mp.INFECTED
end
return mp.CLEAN
