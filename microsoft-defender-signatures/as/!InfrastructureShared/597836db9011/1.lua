-- Threat: !InfrastructureShared
-- Name: 597836db9011
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
