-- Threat: !InfrastructureShared
-- Name: 6d7866eeb4b3
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
