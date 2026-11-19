-- Threat: !InfrastructureShared
-- Name: 3f78463d0b89
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
