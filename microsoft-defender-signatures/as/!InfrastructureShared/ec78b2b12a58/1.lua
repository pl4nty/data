-- Threat: !InfrastructureShared
-- Name: ec78b2b12a58
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 800000 and mp.getfilesize() < 850000 then
  return mp.INFECTED
end
return mp.CLEAN
