-- Threat: !InfrastructureShared
-- Name: 9540bd3d93b3
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
