-- Threat: !InfrastructureShared
-- Name: 987865506917
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
