-- Threat: !InfrastructureShared
-- Name: 2c78b3e82b4b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
