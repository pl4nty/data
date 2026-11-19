-- Threat: !InfrastructureShared
-- Name: 5778ccdd255d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
