-- Threat: !InfrastructureShared
-- Name: a178ba10e311
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
