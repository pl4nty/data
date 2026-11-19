-- Threat: !InfrastructureShared
-- Name: 5c78d99ce8b0
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
