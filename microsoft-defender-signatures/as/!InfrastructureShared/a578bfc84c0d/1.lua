-- Threat: !InfrastructureShared
-- Name: a578bfc84c0d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
