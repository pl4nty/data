-- Threat: !InfrastructureShared
-- Name: 5c78a533aa33
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
