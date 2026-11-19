-- Threat: !InfrastructureShared
-- Name: 6178ef64c53d
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 151552 then
  return mp.INFECTED
end
return mp.CLEAN
