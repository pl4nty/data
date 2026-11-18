-- Threat: !InfrastructureShared
-- Name: 1d787515ebe1
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 50000 then
  return mp.INFECTED
end
return mp.CLEAN
