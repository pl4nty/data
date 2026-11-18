-- Threat: !InfrastructureShared
-- Name: 1f78e4c50c05
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
