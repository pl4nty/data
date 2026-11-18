-- Threat: !InfrastructureShared
-- Name: 6b78130f62e9
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
