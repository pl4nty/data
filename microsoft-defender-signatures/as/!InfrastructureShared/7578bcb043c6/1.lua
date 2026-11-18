-- Threat: !InfrastructureShared
-- Name: 7578bcb043c6
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
