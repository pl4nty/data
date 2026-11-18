-- Threat: !InfrastructureShared
-- Name: a661ccdc17da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
