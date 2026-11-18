-- Threat: !InfrastructureShared
-- Name: 707808095f72
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
