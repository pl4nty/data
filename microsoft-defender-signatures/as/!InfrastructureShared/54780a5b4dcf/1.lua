-- Threat: !InfrastructureShared
-- Name: 54780a5b4dcf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
