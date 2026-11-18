-- Threat: !InfrastructureShared
-- Name: 8d786878be93
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
