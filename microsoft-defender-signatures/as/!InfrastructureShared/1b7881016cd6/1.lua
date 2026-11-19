-- Threat: !InfrastructureShared
-- Name: 1b7881016cd6
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
