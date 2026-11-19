-- Threat: !InfrastructureShared
-- Name: 114780a5d0a0e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
