-- Threat: !InfrastructureShared
-- Name: 3b787f371702
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
