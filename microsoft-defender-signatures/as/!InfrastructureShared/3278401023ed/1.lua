-- Threat: !InfrastructureShared
-- Name: 3278401023ed
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
