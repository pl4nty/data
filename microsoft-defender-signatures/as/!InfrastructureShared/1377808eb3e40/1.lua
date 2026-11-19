-- Threat: !InfrastructureShared
-- Name: 1377808eb3e40
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.suspicious_dosheader and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.CLEAN
