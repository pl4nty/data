-- Threat: !InfrastructureShared
-- Name: 1b78545d3074
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
