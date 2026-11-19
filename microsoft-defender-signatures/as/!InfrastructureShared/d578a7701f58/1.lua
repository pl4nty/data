-- Threat: !InfrastructureShared
-- Name: d578a7701f58
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
