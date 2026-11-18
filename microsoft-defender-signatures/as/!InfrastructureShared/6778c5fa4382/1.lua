-- Threat: !InfrastructureShared
-- Name: 6778c5fa4382
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
