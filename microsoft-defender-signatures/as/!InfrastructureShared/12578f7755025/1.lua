-- Threat: !InfrastructureShared
-- Name: 12578f7755025
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
