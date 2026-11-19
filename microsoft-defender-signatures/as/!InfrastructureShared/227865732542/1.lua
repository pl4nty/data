-- Threat: !InfrastructureShared
-- Name: 227865732542
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
