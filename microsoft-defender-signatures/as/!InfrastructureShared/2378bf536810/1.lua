-- Threat: !InfrastructureShared
-- Name: 2378bf536810
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
