-- Threat: !InfrastructureShared
-- Name: 2a7832886d2a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
