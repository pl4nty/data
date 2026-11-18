-- Threat: !InfrastructureShared
-- Name: 367839858a72
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
