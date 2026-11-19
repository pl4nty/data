-- Threat: !InfrastructureShared
-- Name: 8178e8e30f3b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
