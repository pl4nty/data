-- Threat: !InfrastructureShared
-- Name: 8778346b17b2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
