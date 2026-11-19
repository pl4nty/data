-- Threat: !InfrastructureShared
-- Name: 49785c133393
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 1019904 then
  return mp.INFECTED
end
return mp.CLEAN
