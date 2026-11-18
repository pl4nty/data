-- Threat: !InfrastructureShared
-- Name: c978c25f4468
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
