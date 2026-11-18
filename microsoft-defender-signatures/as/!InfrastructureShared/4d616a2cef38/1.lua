-- Threat: !InfrastructureShared
-- Name: 4d616a2cef38
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
