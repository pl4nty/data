-- Threat: !InfrastructureShared
-- Name: 41789b735bc2
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
