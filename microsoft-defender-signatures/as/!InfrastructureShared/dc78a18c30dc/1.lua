-- Threat: !InfrastructureShared
-- Name: dc78a18c30dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
