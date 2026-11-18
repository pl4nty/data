-- Threat: !InfrastructureShared
-- Name: 3f78043530e6
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
