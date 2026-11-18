-- Threat: !InfrastructureShared
-- Name: 5f78e283f0b8
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 24576 then
  return mp.INFECTED
end
return mp.CLEAN
