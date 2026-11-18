-- Threat: !InfrastructureShared
-- Name: 2f783918fa5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
