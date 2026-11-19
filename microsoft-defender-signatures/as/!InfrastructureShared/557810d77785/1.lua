-- Threat: !InfrastructureShared
-- Name: 557810d77785
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
