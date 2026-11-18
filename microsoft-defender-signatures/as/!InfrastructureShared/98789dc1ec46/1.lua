-- Threat: !InfrastructureShared
-- Name: 98789dc1ec46
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
