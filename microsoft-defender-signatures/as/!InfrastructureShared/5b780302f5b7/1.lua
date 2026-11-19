-- Threat: !InfrastructureShared
-- Name: 5b780302f5b7
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
