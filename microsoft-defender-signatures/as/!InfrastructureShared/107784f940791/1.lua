-- Threat: !InfrastructureShared
-- Name: 107784f940791
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 22272 then
  return mp.INFECTED
end
return mp.CLEAN
