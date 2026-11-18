-- Threat: !InfrastructureShared
-- Name: 617885a8a802
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
