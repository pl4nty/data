-- Threat: !InfrastructureShared
-- Name: 35785c509595
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
