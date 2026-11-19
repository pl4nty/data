-- Threat: !InfrastructureShared
-- Name: 6478a8436d6f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
