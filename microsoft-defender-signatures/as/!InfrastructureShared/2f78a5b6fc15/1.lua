-- Threat: !InfrastructureShared
-- Name: 2f78a5b6fc15
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
