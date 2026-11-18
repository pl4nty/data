-- Threat: !InfrastructureShared
-- Name: 237831b556a6
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
