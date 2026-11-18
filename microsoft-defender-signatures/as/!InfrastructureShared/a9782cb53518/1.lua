-- Threat: !InfrastructureShared
-- Name: a9782cb53518
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
