-- Threat: !InfrastructureShared
-- Name: 9578182296a4
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
