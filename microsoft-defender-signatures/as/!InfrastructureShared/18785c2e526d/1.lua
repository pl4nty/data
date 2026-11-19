-- Threat: !InfrastructureShared
-- Name: 18785c2e526d
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
