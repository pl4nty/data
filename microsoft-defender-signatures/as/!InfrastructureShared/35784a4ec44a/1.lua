-- Threat: !InfrastructureShared
-- Name: 35784a4ec44a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
