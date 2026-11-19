-- Threat: !InfrastructureShared
-- Name: 5b787b009013
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
