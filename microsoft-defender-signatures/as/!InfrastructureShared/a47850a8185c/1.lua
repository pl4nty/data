-- Threat: !InfrastructureShared
-- Name: a47850a8185c
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
