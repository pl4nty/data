-- Threat: !InfrastructureShared
-- Name: 7c7858e94b24
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
