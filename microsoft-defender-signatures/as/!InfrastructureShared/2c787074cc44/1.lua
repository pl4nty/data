-- Threat: !InfrastructureShared
-- Name: 2c787074cc44
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 113152 then
  return mp.INFECTED
end
return mp.CLEAN
