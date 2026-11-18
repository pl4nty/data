-- Threat: !InfrastructureShared
-- Name: 4d788475f26e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
