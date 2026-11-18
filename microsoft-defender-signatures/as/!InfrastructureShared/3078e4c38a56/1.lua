-- Threat: !InfrastructureShared
-- Name: 3078e4c38a56
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
