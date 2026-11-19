-- Threat: !InfrastructureShared
-- Name: 2f780a4cf3ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
