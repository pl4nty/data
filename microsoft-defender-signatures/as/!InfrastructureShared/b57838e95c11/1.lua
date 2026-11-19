-- Threat: !InfrastructureShared
-- Name: b57838e95c11
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
