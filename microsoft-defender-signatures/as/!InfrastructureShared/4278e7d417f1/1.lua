-- Threat: !InfrastructureShared
-- Name: 4278e7d417f1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
