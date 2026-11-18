-- Threat: !InfrastructureShared
-- Name: 8578ac15440c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
