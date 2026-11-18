-- Threat: !InfrastructureShared
-- Name: 167787554db9a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
