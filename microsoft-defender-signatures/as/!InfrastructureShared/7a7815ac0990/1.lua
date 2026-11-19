-- Threat: !InfrastructureShared
-- Name: 7a7815ac0990
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
