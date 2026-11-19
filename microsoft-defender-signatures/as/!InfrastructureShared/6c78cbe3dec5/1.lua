-- Threat: !InfrastructureShared
-- Name: 6c78cbe3dec5
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
