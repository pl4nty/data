-- Threat: !InfrastructureShared
-- Name: c678a760747f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
