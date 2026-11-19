-- Threat: !InfrastructureShared
-- Name: 547835e24aea
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
