-- Threat: !InfrastructureShared
-- Name: 967881a51f93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
