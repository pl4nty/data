-- Threat: !InfrastructureShared
-- Name: 57785ba41294
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 4000000 and mp.getfilesize() > 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
