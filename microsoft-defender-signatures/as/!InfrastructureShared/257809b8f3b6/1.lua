-- Threat: !InfrastructureShared
-- Name: 257809b8f3b6
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
