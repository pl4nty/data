-- Threat: !InfrastructureShared
-- Name: 68786b3f5fee
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
