-- Threat: !InfrastructureShared
-- Name: 22781d52e82a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
