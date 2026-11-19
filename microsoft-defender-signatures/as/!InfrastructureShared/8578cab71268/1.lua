-- Threat: !InfrastructureShared
-- Name: 8578cab71268
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3600000 and mp.getfilesize() < 4300000 then
  return mp.INFECTED
end
return mp.CLEAN
