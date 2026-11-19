-- Threat: !InfrastructureShared
-- Name: 3078d810ad3c
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
