-- Threat: !InfrastructureShared
-- Name: 4778f1eb3877
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1900000 and mp.getfilesize() < 2100000 then
  return mp.INFECTED
end
return mp.CLEAN
