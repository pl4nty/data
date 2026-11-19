-- Threat: !InfrastructureShared
-- Name: 1e7874fe3256
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 197000 and mp.getfilesize() < 198000 then
  return mp.INFECTED
end
return mp.CLEAN
