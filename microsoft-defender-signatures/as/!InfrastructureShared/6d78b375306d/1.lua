-- Threat: !InfrastructureShared
-- Name: 6d78b375306d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
