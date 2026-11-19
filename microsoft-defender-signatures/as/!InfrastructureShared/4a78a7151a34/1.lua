-- Threat: !InfrastructureShared
-- Name: 4a78a7151a34
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
