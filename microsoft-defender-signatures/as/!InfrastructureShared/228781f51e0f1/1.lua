-- Threat: !InfrastructureShared
-- Name: 228781f51e0f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
