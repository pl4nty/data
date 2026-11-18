-- Threat: !InfrastructureShared
-- Name: 7578493a89e2
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
