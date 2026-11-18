-- Threat: !InfrastructureShared
-- Name: b540f862197e
-- Type: 21

if peattributes.isexe == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
