-- Threat: !InfrastructureShared
-- Name: 4678658bdd5a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 200000 and mp.getfilesize() < 220000 then
  return mp.INFECTED
end
return mp.CLEAN
