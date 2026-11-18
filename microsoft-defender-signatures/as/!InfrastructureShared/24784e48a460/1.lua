-- Threat: !InfrastructureShared
-- Name: 24784e48a460
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
