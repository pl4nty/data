-- Threat: !InfrastructureShared
-- Name: 6c7827b7460d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
