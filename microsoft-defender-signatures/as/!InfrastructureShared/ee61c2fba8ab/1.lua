-- Threat: !InfrastructureShared
-- Name: ee61c2fba8ab
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
