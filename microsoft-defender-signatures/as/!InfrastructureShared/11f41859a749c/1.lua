-- Threat: !InfrastructureShared
-- Name: 11f41859a749c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
