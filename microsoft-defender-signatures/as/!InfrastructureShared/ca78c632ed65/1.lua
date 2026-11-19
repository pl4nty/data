-- Threat: !InfrastructureShared
-- Name: ca78c632ed65
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
