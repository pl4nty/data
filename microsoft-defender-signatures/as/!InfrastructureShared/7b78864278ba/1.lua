-- Threat: !InfrastructureShared
-- Name: 7b78864278ba
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
