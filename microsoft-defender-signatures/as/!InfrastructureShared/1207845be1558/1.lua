-- Threat: !InfrastructureShared
-- Name: 1207845be1558
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
