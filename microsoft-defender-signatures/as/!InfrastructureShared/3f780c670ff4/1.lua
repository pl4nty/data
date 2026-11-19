-- Threat: !InfrastructureShared
-- Name: 3f780c670ff4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
