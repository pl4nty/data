-- Threat: !InfrastructureShared
-- Name: 4c78e73401f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
