-- Threat: !InfrastructureShared
-- Name: 3d7898edfeb6
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 45312 then
  return mp.INFECTED
end
return mp.CLEAN
