-- Threat: !InfrastructureShared
-- Name: e878ef4f2f42
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
