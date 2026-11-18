-- Threat: !InfrastructureShared
-- Name: 1177873815d30
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 434176 then
  return mp.INFECTED
end
return mp.CLEAN
