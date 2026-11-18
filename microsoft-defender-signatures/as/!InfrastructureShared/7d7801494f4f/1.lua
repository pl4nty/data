-- Threat: !InfrastructureShared
-- Name: 7d7801494f4f
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
