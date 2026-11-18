-- Threat: !InfrastructureShared
-- Name: 98789c262da2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
