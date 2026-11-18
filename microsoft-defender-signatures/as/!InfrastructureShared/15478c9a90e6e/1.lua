-- Threat: !InfrastructureShared
-- Name: 15478c9a90e6e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 23000000 and mp.getfilesize() < 24000000 then
  return mp.INFECTED
end
return mp.CLEAN
