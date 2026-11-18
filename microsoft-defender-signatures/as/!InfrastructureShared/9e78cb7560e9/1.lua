-- Threat: !InfrastructureShared
-- Name: 9e78cb7560e9
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
