-- Threat: !InfrastructureShared
-- Name: 4f785069d2a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
