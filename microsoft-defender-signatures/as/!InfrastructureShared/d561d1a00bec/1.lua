-- Threat: !InfrastructureShared
-- Name: d561d1a00bec
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
