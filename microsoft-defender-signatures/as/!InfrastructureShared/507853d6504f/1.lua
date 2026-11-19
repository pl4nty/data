-- Threat: !InfrastructureShared
-- Name: 507853d6504f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 200000 and mp.getfilesize() < 210000 then
  return mp.INFECTED
end
return mp.CLEAN
