-- Threat: !InfrastructureShared
-- Name: 607802e01746
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
