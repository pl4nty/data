-- Threat: !InfrastructureShared
-- Name: 70785169bca4
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
