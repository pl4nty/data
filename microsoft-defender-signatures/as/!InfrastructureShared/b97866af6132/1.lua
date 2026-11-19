-- Threat: !InfrastructureShared
-- Name: b97866af6132
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
