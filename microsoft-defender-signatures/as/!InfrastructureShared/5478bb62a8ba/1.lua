-- Threat: !InfrastructureShared
-- Name: 5478bb62a8ba
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
