-- Threat: !InfrastructureShared
-- Name: 3278cfbcdd93
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 645426 then
  return mp.INFECTED
end
return mp.CLEAN
