-- Threat: !InfrastructureShared
-- Name: 8478c21407ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
