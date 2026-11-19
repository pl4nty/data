-- Threat: !InfrastructureShared
-- Name: 2c78948e2f24
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
