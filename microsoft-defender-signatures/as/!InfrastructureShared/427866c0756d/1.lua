-- Threat: !InfrastructureShared
-- Name: 427866c0756d
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
