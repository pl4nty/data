-- Threat: !InfrastructureShared
-- Name: 9b78e5082c0f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
