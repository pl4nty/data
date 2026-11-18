-- Threat: !InfrastructureShared
-- Name: 74788d1ece58
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
