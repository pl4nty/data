-- Threat: !InfrastructureShared
-- Name: 7878115812ab
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
