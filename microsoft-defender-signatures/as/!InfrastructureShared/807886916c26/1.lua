-- Threat: !InfrastructureShared
-- Name: 807886916c26
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 7168 then
  return mp.INFECTED
end
return mp.CLEAN
