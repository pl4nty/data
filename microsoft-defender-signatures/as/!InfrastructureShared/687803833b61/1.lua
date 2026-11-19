-- Threat: !InfrastructureShared
-- Name: 687803833b61
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
