-- Threat: !InfrastructureShared
-- Name: 1f540821a9c40
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
