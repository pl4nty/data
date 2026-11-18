-- Threat: !InfrastructureShared
-- Name: ab78838b0e0f
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 49152 then
  return mp.INFECTED
end
return mp.CLEAN
