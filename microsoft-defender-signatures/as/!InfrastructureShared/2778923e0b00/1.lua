-- Threat: !InfrastructureShared
-- Name: 2778923e0b00
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
