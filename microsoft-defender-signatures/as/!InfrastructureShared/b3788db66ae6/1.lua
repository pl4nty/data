-- Threat: !InfrastructureShared
-- Name: b3788db66ae6
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.amd64_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
