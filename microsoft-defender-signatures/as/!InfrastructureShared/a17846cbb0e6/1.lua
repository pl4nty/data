-- Threat: !InfrastructureShared
-- Name: a17846cbb0e6
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
