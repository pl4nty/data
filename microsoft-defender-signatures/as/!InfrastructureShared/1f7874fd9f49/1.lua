-- Threat: !InfrastructureShared
-- Name: 1f7874fd9f49
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
