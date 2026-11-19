-- Threat: !InfrastructureShared
-- Name: 2f7845ccb8a8
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
