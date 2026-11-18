-- Threat: !InfrastructureShared
-- Name: 897873215441
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
