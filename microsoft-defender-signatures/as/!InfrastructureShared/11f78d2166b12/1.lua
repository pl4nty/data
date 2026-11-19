-- Threat: !InfrastructureShared
-- Name: 11f78d2166b12
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
