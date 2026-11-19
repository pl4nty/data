-- Threat: !InfrastructureShared
-- Name: 27078b5c9aad1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
