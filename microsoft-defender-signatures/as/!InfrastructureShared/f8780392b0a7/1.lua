-- Threat: !InfrastructureShared
-- Name: f8780392b0a7
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 65280 then
  return mp.INFECTED
end
return mp.CLEAN
