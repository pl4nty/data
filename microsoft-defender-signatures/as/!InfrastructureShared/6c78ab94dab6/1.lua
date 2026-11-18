-- Threat: !InfrastructureShared
-- Name: 6c78ab94dab6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
