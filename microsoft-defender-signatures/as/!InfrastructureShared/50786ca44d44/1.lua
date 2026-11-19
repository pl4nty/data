-- Threat: !InfrastructureShared
-- Name: 50786ca44d44
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
