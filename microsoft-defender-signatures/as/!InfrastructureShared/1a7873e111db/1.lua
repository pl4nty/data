-- Threat: !InfrastructureShared
-- Name: 1a7873e111db
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
