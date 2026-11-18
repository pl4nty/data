-- Threat: !InfrastructureShared
-- Name: 2c78d4df1f12
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
