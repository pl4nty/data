-- Threat: !InfrastructureShared
-- Name: c578d839c8f9
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
