-- Threat: !InfrastructureShared
-- Name: 787895e7324d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
