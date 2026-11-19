-- Threat: !InfrastructureShared
-- Name: 1bb78c4955e37
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
