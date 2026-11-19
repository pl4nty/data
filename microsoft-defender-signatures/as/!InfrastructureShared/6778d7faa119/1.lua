-- Threat: !InfrastructureShared
-- Name: 6778d7faa119
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
