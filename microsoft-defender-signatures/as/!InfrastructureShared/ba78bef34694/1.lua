-- Threat: !InfrastructureShared
-- Name: ba78bef34694
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
