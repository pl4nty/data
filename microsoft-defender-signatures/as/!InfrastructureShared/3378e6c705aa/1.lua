-- Threat: !InfrastructureShared
-- Name: 3378e6c705aa
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
