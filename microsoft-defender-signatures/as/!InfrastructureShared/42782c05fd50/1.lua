-- Threat: !InfrastructureShared
-- Name: 42782c05fd50
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
