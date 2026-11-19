-- Threat: !InfrastructureShared
-- Name: 11878fd51e50a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3900000 then
  return mp.INFECTED
end
return mp.CLEAN
