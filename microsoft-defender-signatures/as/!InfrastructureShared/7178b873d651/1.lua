-- Threat: !InfrastructureShared
-- Name: 7178b873d651
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
