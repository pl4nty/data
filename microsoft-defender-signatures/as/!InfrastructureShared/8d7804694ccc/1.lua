-- Threat: !InfrastructureShared
-- Name: 8d7804694ccc
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
