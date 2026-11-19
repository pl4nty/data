-- Threat: !InfrastructureShared
-- Name: 68788a4a9f2f
-- Type: 21

if peattributes.ismsil == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
