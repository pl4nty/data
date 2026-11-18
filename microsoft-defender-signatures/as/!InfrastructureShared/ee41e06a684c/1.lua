-- Threat: !InfrastructureShared
-- Name: ee41e06a684c
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 5376 then
  return mp.INFECTED
end
return mp.CLEAN
