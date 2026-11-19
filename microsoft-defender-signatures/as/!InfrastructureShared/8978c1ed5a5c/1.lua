-- Threat: !InfrastructureShared
-- Name: 8978c1ed5a5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
