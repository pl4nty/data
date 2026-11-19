-- Threat: !InfrastructureShared
-- Name: bd78e23f5778
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 3735552 then
  return mp.INFECTED
end
return mp.CLEAN
