-- Threat: !InfrastructureShared
-- Name: 59781f9c4c75
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
