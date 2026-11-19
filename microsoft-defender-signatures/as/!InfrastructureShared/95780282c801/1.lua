-- Threat: !InfrastructureShared
-- Name: 95780282c801
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
