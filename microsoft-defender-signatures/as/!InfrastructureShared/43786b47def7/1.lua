-- Threat: !InfrastructureShared
-- Name: 43786b47def7
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
