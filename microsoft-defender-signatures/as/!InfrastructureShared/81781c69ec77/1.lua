-- Threat: !InfrastructureShared
-- Name: 81781c69ec77
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
