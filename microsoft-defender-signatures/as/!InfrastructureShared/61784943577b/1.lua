-- Threat: !InfrastructureShared
-- Name: 61784943577b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
