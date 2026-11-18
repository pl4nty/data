-- Threat: !InfrastructureShared
-- Name: 15c78bcb27b5a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
