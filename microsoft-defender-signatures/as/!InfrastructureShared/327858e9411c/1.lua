-- Threat: !InfrastructureShared
-- Name: 327858e9411c
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
