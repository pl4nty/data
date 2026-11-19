-- Threat: !InfrastructureShared
-- Name: a478f06f8a90
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
