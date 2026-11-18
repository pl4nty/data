-- Threat: !InfrastructureShared
-- Name: 277853f42450
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
