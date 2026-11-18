-- Threat: !InfrastructureShared
-- Name: f7783709bb82
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 262144 then
  return mp.INFECTED
end
return mp.CLEAN
