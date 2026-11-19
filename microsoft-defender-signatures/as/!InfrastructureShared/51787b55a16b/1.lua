-- Threat: !InfrastructureShared
-- Name: 51787b55a16b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1170000 and mp.getfilesize() < 1180000 then
  return mp.INFECTED
end
return mp.CLEAN
