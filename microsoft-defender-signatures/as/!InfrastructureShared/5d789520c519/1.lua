-- Threat: !InfrastructureShared
-- Name: 5d789520c519
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
