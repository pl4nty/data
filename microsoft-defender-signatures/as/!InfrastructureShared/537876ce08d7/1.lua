-- Threat: !InfrastructureShared
-- Name: 537876ce08d7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
