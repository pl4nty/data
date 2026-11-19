-- Threat: !InfrastructureShared
-- Name: 3278acab3177
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
