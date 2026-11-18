-- Threat: !InfrastructureShared
-- Name: 8078894f5f59
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
