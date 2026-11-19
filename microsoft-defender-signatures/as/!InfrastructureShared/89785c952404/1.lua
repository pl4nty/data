-- Threat: !InfrastructureShared
-- Name: 89785c952404
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
