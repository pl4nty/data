-- Threat: !InfrastructureShared
-- Name: 2578f3a53fee
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
