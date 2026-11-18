-- Threat: !InfrastructureShared
-- Name: 80781053eeda
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
