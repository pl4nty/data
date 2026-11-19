-- Threat: !InfrastructureShared
-- Name: 12261a7bca6be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
