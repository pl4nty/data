-- Threat: !InfrastructureShared
-- Name: 2f78e0f1dd05
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
