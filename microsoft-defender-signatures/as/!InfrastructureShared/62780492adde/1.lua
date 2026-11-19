-- Threat: !InfrastructureShared
-- Name: 62780492adde
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
