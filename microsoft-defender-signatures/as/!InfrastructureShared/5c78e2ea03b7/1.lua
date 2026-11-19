-- Threat: !InfrastructureShared
-- Name: 5c78e2ea03b7
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 262144 then
  return mp.INFECTED
end
return mp.CLEAN
