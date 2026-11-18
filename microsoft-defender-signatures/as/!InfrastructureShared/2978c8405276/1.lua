-- Threat: !InfrastructureShared
-- Name: 2978c8405276
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
