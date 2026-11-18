-- Threat: !InfrastructureShared
-- Name: 7f78831cb2a7
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
