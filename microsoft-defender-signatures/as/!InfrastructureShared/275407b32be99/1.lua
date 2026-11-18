-- Threat: !InfrastructureShared
-- Name: 275407b32be99
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
