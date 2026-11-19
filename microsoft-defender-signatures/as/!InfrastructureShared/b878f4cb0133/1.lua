-- Threat: !InfrastructureShared
-- Name: b878f4cb0133
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
