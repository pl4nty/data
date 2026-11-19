-- Threat: !InfrastructureShared
-- Name: 5b78832795af
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
