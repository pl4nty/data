-- Threat: !InfrastructureShared
-- Name: 6a78e45df7d1
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
