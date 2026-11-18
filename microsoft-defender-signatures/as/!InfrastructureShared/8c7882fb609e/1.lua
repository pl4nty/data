-- Threat: !InfrastructureShared
-- Name: 8c7882fb609e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
