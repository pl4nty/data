-- Threat: !InfrastructureShared
-- Name: 7f7819365f10
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
