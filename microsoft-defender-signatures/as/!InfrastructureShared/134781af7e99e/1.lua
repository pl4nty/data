-- Threat: !InfrastructureShared
-- Name: 134781af7e99e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
