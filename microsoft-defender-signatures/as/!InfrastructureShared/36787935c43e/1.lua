-- Threat: !InfrastructureShared
-- Name: 36787935c43e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 21000 then
  return mp.INFECTED
end
return mp.CLEAN
