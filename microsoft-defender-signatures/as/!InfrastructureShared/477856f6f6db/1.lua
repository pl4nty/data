-- Threat: !InfrastructureShared
-- Name: 477856f6f6db
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1200000 and mp.getfilesize() < 1600000 then
  return mp.INFECTED
end
return mp.CLEAN
