-- Threat: !InfrastructureShared
-- Name: 657807dfb597
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
