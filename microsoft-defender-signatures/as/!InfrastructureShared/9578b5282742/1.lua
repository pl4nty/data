-- Threat: !InfrastructureShared
-- Name: 9578b5282742
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 4260000 then
  return mp.INFECTED
end
return mp.CLEAN
