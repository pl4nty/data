-- Threat: !InfrastructureShared
-- Name: 3b78ef8080f5
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
