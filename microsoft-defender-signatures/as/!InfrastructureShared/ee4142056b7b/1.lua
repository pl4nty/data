-- Threat: !InfrastructureShared
-- Name: ee4142056b7b
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
