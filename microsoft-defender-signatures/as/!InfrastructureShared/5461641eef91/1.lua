-- Threat: !InfrastructureShared
-- Name: 5461641eef91
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
