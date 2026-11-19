-- Threat: !InfrastructureShared
-- Name: 1578d8a9678e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 6330000 and mp.getfilesize() <= 6340000 then
  return mp.INFECTED
end
return mp.CLEAN
