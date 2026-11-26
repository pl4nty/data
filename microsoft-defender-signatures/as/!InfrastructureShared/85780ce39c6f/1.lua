-- Threat: !InfrastructureShared
-- Name: 85780ce39c6f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
