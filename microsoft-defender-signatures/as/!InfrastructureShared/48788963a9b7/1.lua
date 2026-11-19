-- Threat: !InfrastructureShared
-- Name: 48788963a9b7
-- Type: 21

if peattributes.ismsil and peattributes.amd64_image and peattributes.no_ep then
  return mp.INFECTED
end
return mp.CLEAN
