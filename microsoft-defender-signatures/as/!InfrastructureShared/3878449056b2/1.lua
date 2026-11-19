-- Threat: !InfrastructureShared
-- Name: 3878449056b2
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
