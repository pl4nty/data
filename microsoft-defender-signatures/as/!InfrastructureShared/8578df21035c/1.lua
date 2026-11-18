-- Threat: !InfrastructureShared
-- Name: 8578df21035c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
