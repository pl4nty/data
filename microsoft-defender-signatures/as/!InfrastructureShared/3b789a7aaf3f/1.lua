-- Threat: !InfrastructureShared
-- Name: 3b789a7aaf3f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
