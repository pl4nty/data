-- Threat: !InfrastructureShared
-- Name: aa780632c449
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
