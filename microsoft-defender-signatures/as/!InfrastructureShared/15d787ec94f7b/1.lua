-- Threat: !InfrastructureShared
-- Name: 15d787ec94f7b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
