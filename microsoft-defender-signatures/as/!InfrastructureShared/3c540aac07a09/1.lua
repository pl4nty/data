-- Threat: !InfrastructureShared
-- Name: 3c540aac07a09
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
