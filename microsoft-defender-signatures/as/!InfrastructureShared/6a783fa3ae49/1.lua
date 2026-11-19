-- Threat: !InfrastructureShared
-- Name: 6a783fa3ae49
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
