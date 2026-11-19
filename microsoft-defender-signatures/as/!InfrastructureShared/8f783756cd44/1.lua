-- Threat: !InfrastructureShared
-- Name: 8f783756cd44
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
