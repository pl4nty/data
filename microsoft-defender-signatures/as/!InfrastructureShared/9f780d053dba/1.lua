-- Threat: !InfrastructureShared
-- Name: 9f780d053dba
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
