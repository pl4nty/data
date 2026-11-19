-- Threat: !InfrastructureShared
-- Name: 9978c5e16e43
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
