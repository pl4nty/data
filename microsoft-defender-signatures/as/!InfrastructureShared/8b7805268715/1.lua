-- Threat: !InfrastructureShared
-- Name: 8b7805268715
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
