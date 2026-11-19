-- Threat: !InfrastructureShared
-- Name: 3478df0abc21
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
