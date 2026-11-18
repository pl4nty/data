-- Threat: !InfrastructureShared
-- Name: 75409b8d31fd
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
