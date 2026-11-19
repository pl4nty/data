-- Threat: !InfrastructureShared
-- Name: 754060d5b3fe
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
