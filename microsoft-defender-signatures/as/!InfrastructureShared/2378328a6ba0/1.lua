-- Threat: !InfrastructureShared
-- Name: 2378328a6ba0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
